from flask import Flask, request, jsonify, render_template_string
import os, sqlite3

# DB lives on a persistent disk at /data inside Render
DB_PATH = os.getenv("DB_PATH", "/data/storebot.db")

app = Flask(__name__)

def connect():
    return sqlite3.connect(DB_PATH)

def init_db():
    # if database file doesn’t exist or is empty, seed it
    first_time = not os.path.exists(DB_PATH) or os.path.getsize(DB_PATH) == 0
    with connect() as conn:
        cur = conn.cursor()
        if first_time:
            # run seed.sql to create tables + insert data
            with open("seed.sql", "r", encoding="utf-8") as f:
                cur.executescript(f.read())
            conn.commit()

@app.route("/")
def home():
    q = request.args.get("q", "").strip()
    if not q:
        return render_template_string(PAGE, q="", results=[], mode=None)

    if q.lower().startswith("list "):
        try:
            aisle = int(q.split()[1])
        except:
            return render_template_string(PAGE, q=q, results=[("Usage: list <aisle_no>", "", "")], mode="error")
        with connect() as conn:
            rows = conn.execute("""SELECT product_name FROM products
                                   WHERE aisle_id=? ORDER BY product_name""", (aisle,)).fetchall()
        out = [(r[0], "", "") for r in rows]
        return render_template_string(PAGE, q=q, results=out, mode=f"list {aisle}")

    # default: search product
    with connect() as conn:
        rows = conn.execute("""
            SELECT p.product_name, a.aisle_id, a.aisle_name
            FROM products p JOIN aisles a ON p.aisle_id=a.aisle_id
            WHERE p.product_name LIKE ? ORDER BY p.product_name LIMIT 100
        """, (f"%{q}%",)).fetchall()
    return render_template_string(PAGE, q=q, results=rows, mode="where")

@app.route("/api/where")
def api_where():
    q = request.args.get("q","").strip()
    with connect() as conn:
        rows = conn.execute("""
            SELECT p.product_name, a.aisle_id, a.aisle_name
            FROM products p JOIN aisles a ON p.aisle_id=a.aisle_id
            WHERE p.product_name LIKE ? ORDER BY p.product_name LIMIT 100
        """, (f"%{q}%",)).fetchall()
    return jsonify([{"product_name":n,"aisle_id":aid,"aisle_name":an} for (n,aid,an) in rows])

@app.route("/api/aisle/<int:aisle_no>")
def api_aisle(aisle_no):
    with connect() as conn:
        rows = conn.execute("""SELECT product_name FROM products
                               WHERE aisle_id=? ORDER BY product_name""", (aisle_no,)).fetchall()
    return jsonify({"aisle": aisle_no, "products":[{"product_name":r[0]} for r in rows]})

PAGE = """
<!doctype html><meta name=viewport content="width=device-width,initial-scale=1">
<title>Store Aisle Chatbot</title>
<style>
 body{font-family:system-ui,Segoe UI,Inter,Arial;margin:24px;max-width:820px}
 input{padding:10px;border:1px solid #bbb;border-radius:8px;width:70%}
 button{padding:10px 14px;border:0;background:#2563eb;color:#fff;border-radius:8px}
 li{margin:6px 0;padding:8px;border:1px solid #ddd;border-radius:8px}
 .muted{color:#666}
</style>
<h2>Store Aisle Chatbot</h2>
<form>
  <input name="q" value="{{q}}" placeholder="Try: beans  •  list 18" autofocus>
  <button>Ask</button>
</form>
{% if mode %}
  {% if mode.startswith("list") %}
    <h3>Products in {{mode.split()[1]}}</h3>
  {% elif mode=="where" %}
    <h3>Matches</h3>
  {% elif mode=="error" %}
    <h3 class="muted">Usage: list &lt;aisle_no&gt;</h3>
  {% endif %}
  <ul>
  {% for name, aid, an in results %}
    {% if aid %}
      <li><strong>{{name}}</strong> → Aisle {{aid}} <span class="muted">({{an}})</span></li>
    {% else %}
      <li>{{name}}</li>
    {% endif %}
  {% endfor %}
  </ul>
{% endif %}
<p class="muted">API: /api/where?q=beans  •  /api/aisle/18</p>
"""

if __name__ == "__main__":
    init_db()
    app.run(host="0.0.0.0", port=8000)
