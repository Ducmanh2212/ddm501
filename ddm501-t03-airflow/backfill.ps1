# Run backfill across dates
param(
    [string]$StartDate = "2026-08-22",
    [string]$EndDate = "2026-08-24"
)

$curr = (Get-Item .).FullName.Replace('\', '/')
$env:PATH = "$curr/.venv/Scripts;" + $env:PATH
$env:AIRFLOW_HOME = "$curr/.airflow"
$env:AIRFLOW__DATABASE__SQL_ALCHEMY_CONN = "sqlite:///$curr/.airflow/airflow.db"
$env:AIRFLOW__CORE__DAGS_FOLDER = "$curr/dags"
$env:AIRFLOW__CORE__LOAD_EXAMPLES = "False"
$env:PYTHONIOENCODING = "utf-8"
$env:PYTHONUTF8 = "1"

Write-Host "Chay backfill tu $StartDate den $EndDate ..."
& .venv\Scripts\airflow.exe dags backfill wdbc_pipeline -s $StartDate -e $EndDate --reset-dagruns -y
