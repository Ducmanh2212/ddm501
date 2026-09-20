# Helper script to start Airflow Web UI on port 18080
$curr = (Get-Item .).FullName.Replace('\', '/')
$env:PATH = "$curr/.venv/Scripts;" + $env:PATH
$env:AIRFLOW_HOME = "$curr/.airflow"
$env:AIRFLOW__DATABASE__SQL_ALCHEMY_CONN = "sqlite:///$curr/.airflow/airflow.db"
$env:AIRFLOW__CORE__DAGS_FOLDER = "$curr/dags"
$env:AIRFLOW__CORE__LOAD_EXAMPLES = "False"
$env:PYTHONIOENCODING = "utf-8"
$env:PYTHONUTF8 = "1"
$env:AIRFLOW_WEBSERVER_PORT = "18080"
$env:AIRFLOW_WEBSERVER_HOST = "127.0.0.1"

Write-Host "Khoi dong Airflow Web UI tai http://127.0.0.1:18080 ..."
Write-Host "Tai khoan: admin"
Write-Host "Mat khau:  admin"
& .venv\Scripts\python.exe webserver.py
