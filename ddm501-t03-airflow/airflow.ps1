$curr = (Get-Item .).FullName.Replace('\', '/')
$env:PATH = "$curr/.venv/Scripts;" + $env:PATH
$env:AIRFLOW_HOME = "$curr/.airflow"
$env:AIRFLOW__DATABASE__SQL_ALCHEMY_CONN = "sqlite:///$curr/.airflow/airflow.db"
$env:AIRFLOW__CORE__DAGS_FOLDER = "$curr/dags"
$env:AIRFLOW__CORE__LOAD_EXAMPLES = "False"
$env:PYTHONIOENCODING = "utf-8"
$env:PYTHONUTF8 = "1"

if ($args.Count -eq 0) {
    & .venv\Scripts\airflow.exe --help
} else {
    & .venv\Scripts\airflow.exe $args
}
