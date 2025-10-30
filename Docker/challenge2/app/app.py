from flask import Flask, render_template
import redis
import os

app = Flask(__name__)

# Redis configuration
redis_host = os.getenv('REDIS_HOST', 'redis')
redis_port = int(os.getenv('REDIS_PORT', 6379))
r = redis.Redis(host=redis_host, port=redis_port, decode_responses=True)

def get_visits():
    return r.incr("visits")

@app.route('/')
def home():
    visits = get_visits()
    return render_template('home.html', visits=visits)

@app.route('/about')
def about():
    visits = get_visits()
    return render_template('about.html', visits=visits)

@app.route('/welcome')
def welcome():
    visits = get_visits()
    return render_template('welcome.html', visits=visits)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
