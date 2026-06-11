import logging
import os
from flask import Flask, request, jsonify

# ---------------------------------------------------------------------------
# Logging is configured to write to STDOUT. On Azure App Service (Linux),
# anything an app prints to stdout/stderr is captured into the
# "AppServiceConsoleLogs" table once Diagnostic Settings are enabled.
# We use a CONSISTENT, PARSEABLE format so KQL can extract fields later.
# Pattern:  LOGIN_FAILED user=<name> ip=<addr>
# ---------------------------------------------------------------------------
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(name)s %(message)s",
)
logger = logging.getLogger("auth")

app = Flask(__name__)

# Demo-only "user store". NEVER hardcode credentials in a real app.
# In production this would be Auth0 / Entra ID / a hashed DB lookup.
VALID_USERS = {
    "admin": "P@ssw0rd123",
    "divyang": "CloudOps2026",
}


def get_client_ip():
    """App Service sits behind a reverse proxy, so request.remote_addr is the
    proxy's IP. The real caller is the first entry in X-Forwarded-For."""
    forwarded = request.headers.get("X-Forwarded-For", "")
    if forwarded:
        return forwarded.split(",")[0].strip()
    return request.remote_addr or "unknown"


@app.route("/")
def health():
    return jsonify(status="ok", service="cst8919-lab2-threat-detection"), 200


@app.route("/login", methods=["POST"])
def login():
    data = request.get_json(silent=True) or {}
    username = data.get("username", "unknown")
    password = data.get("password", "")
    ip = get_client_ip()

    if VALID_USERS.get(username) == password:
        # %s formatting (not f-strings) lets logging handle the substitution
        # and keeps the structured pattern intact.
        logger.info("LOGIN_SUCCESS user=%s ip=%s", username, ip)
        return jsonify(message="Login successful"), 200

    logger.warning("LOGIN_FAILED user=%s ip=%s", username, ip)
    return jsonify(message="Invalid credentials"), 401


if __name__ == "__main__":
    # Local dev only. App Service uses gunicorn (see startup command).
    port = int(os.environ.get("PORT", 8000))
    app.run(host="0.0.0.0", port=port)
