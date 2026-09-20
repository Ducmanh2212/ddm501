# Run DAG test for wdbc_pipeline
param(
    [string]$LogicalDate = "2026-08-25"
)

$curr = (Get-Item .).FullName.Replace('\', '/')
$env:PATH = "$curr/.venv/Scripts;" + $env:PATH
$env:AIRFLOW_HOME = "$curr/.airflow"
$env:AIRFLOW__DATABASE__SQL_ALCHEMY_CONN = "sqlite:///$curr/.airflow/airflow.db"
$env:AIRFLOW__CORE__DAGS_FOLDER = "$curr/dags"
$env:AIRFLOW__CORE__LOAD_EXAMPLES = "False"
$env:PYTHONIOENCODING = "utf-8"
$env:PYTHONUTF8 = "1"

Write-Host "Chay test pipeline voi logical date: $LogicalDate"
& .venv\Scripts\airflow.exe dags test wdbc_pipeline $LogicalDate
