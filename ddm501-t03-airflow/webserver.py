import os
from waitress import serve
import airflow.www.app

port = int(os.getenv("AIRFLOW_WEBSERVER_PORT", "18080"))
host = os.getenv("AIRFLOW_WEBSERVER_HOST", "127.0.0.1")

print(f"Airflow Web UI starting at http://{host}:{port}")
app = airflow.www.app.cached_app()
serve(app, host=host, port=port, threads=8)
