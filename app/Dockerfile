FROM python:3.10-slim

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app

# Expose the port that the app runs on
EXPOSE 5000

CMD ["python", "app.py"]
