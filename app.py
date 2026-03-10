from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "DevOps CI/CD Pipeline Working!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
