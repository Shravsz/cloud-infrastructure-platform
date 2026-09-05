from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def home():
    return "Cloud Infrastructure Automation Platform v1.1"


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy"
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)