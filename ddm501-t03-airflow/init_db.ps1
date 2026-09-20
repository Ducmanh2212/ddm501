$curr = (Get-Item .).FullName.Replace('\', '/')
$env:AIRFLOW_HOME = "$curr/.airflow"
$env:AIRFLOW__DATABASE__SQL_ALCHEMY_CONN = "sqlite:///$curr/.airflow/airflow.db"
$env:AIRFLOW__CORE__DAGS_FOLDER = "$curr/dags"
$env:AIRFLOW__CORE__LOAD_EXAMPLES = "False"
$env:PYTHONIOENCODING = "utf-8"
$env:PYTHONUTF8 = "1"

& .venv\Scripts\airflow.exe db migrate
