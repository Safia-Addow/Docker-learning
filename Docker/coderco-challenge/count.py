from flask import Flask
import redis

app = Flask(__name__)

redis_client = redis.StrictRedis(host='redis', port=6379, decode_responses=True)

@app.route('/')
def welcome():
    return "✅ Welcome! Flask + Redis coderco challenge!"

@app.route('/count')
def count():
    count=redis_client.incr("visits")
   # visits = redis_client.get("visits")
    return f"🔢 this Page has been visited {count} times."

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
