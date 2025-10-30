# 🚀 Flask + Redis + Tailwind App

A simple demo web application built with **Flask**, **Redis**, and **Tailwind CSS**, running seamlessly via **Docker Compose**.  
It demonstrates Flask routing, Redis-based visit counting, and Tailwind-powered UI styling.

---

## 🗂️ Project Structure

project/
│
├── app/
│ ├── init.py
│ ├── static/
│ │ └── css/
│ │ ├── tailwind.css # Tailwind source
│ │ └── main.css # Compiled Tailwind output
│ ├── templates/
│ │ ├── base.html
│ │ ├── home.html
│ │ ├── about.html
│ │ └── welcome.html
│ └── app.py
│
├── Dockerfile
├── docker-compose.yml
├── tailwind.config.js
├── package.json
└── README.md


---

## ⚙️ Setup & Run (Local)

### 1. Create a virtual environment

```bash
python -m venv venv
source venv/bin/activate   # Linux / Mac
venv\Scripts\activate      # Windows
pip install -r requirements.txt


2. Install dependencies
pip install -r requirements.txt

3. Run Redis (locally)
Make sure Redis is running on your system:
redis-server

4. Run Flask
flask run

Your app should now be running at:
👉 http://localhost:5000

🎨 Tailwind CSS Setup
1. Install Node.js dependencies
npm install

2. Create your Tailwind source file (if missing)
app/static/css/tailwind.css:
@tailwind base;
@tailwind components;
@tailwind utilities;

3. Build Tailwind CSS
npm run build:css

This generates app/static/css/main.css, which Flask loads via:
<link rel="stylesheet" href="{{ url_for('static', filename='css/main.css') }}">

Keep the process running to automatically rebuild on file changes.

🐳 Run with Docker Compose
Make sure Docker Desktop (or Docker Engine) is running.
1. Build and start the containers
docker-compose up --build

This will start:


flask_app — your Flask app


redis — in-memory data store


(optional) nginx — reverse proxy if configured


2. Visit your app
Open in your browser:
👉 http://localhost:5000
3. Stop containers
docker-compose down


🧰 Environment Variables
Create a .env file (optional):
FLASK_ENV=development
REDIS_HOST=redis
REDIS_PORT=6379


🧪 Test Tailwind
Inside any template (e.g., home.html), add:
<h1 class="text-4xl text-indigo-600 font-bold">Tailwind is working 🎉</h1>

If the text appears large and indigo, Tailwind is set up correctly ✅

🧱 Tech Stack


🐍 Flask — Lightweight Python web framework


🧠 Redis — In-memory data store for visit counting


🎨 Tailwind CSS — Utility-first CSS framework


🐳 Docker Compose — Multi-container setup



💻 Author
Coderco Challenge Project
Built with ❤️ using Flask, Redis, and Tailwind CSS.

---
