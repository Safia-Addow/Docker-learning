# ----------------------
# Stage 1: Build stage
# ----------------------
FROM python:3.8-slim AS build

WORKDIR /app

# Install system dependencies for mysqlclient
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy Python requirements (if you have a requirements.txt)
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# Or install directly
RUN pip install --no-cache-dir flask mysqlclient

# Copy the application code
COPY . .

# ----------------------
# Stage 2: Production stage
# ----------------------
FROM python:3.8-slim

WORKDIR /app

# Copy everything from build stage
COPY --from=build /app /app

# Expose port
EXPOSE 5002

# Run the Flask app
CMD ["python", "app.py"]
