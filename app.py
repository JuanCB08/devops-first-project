from flask import Flask, jsonify
import os

app = Flask(__name__)


@app.route("/")
def home():
    return jsonify(
        mensaje="¡Hola Juan! Tu primer despliegue de DevOps está funcionando 🚀",
        estado="ok",
    )


@app.route("/health")
def health():
    """Endpoint de salud, útil para monitoreo y health checks en producción."""
    return jsonify(status="healthy"), 200


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
