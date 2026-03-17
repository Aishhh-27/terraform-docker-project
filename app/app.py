from flask import Flask
import psycopg2
import os

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(
        host="postgres_db",
        database="mydb",
        user="admin",
        password="admin"
    )
    return conn

@app.route('/')
def home():
    try:
        conn = get_db_connection()
        return "✅ Connected to PostgreSQL!"
    except Exception as e:
        return f"❌ DB Connection Failed: {e}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
