$ErrorActionPreference = "Stop"

# Asegúrate de que las variables de entorno estén definidas
if (-not $env:PROJECT_ID) { throw "La variable de entorno PROJECT_ID no está definida." }
if (-not $env:REGION) { throw "La variable de entorno REGION no está definida." }

gcloud builds submit . `
    --project=$env:PROJECT_ID `
    --gcs-source-staging-dir="gs://run-resources-$($env:PROJECT_ID)-$($env:REGION)/services/creative-studio" `
    --region=$env:REGION `
    --service-account="projects/$($env:PROJECT_ID)/serviceAccounts/builds-creative-studio@$($env:PROJECT_ID).iam.gserviceaccount.com"
