# Dockerfile
FROM python:3.12-slim

# Evita buffering e .pyc
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Dipendenze
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Codice
COPY . .

# Cloud Run usa la porta in $PORT (default 8080)
ENV PORT=8080
EXPOSE 8080

# Avvio
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT}"]
