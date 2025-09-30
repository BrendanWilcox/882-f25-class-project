gcloud config set project bjwilcox-ba882-fall25

echo "======================================================"
echo "deploying the schema setup"
echo "======================================================"

gcloud functions deploy raw-schema-setup \
    --gen2 \
    --runtime python312 \
    --trigger-http \
    --entry-point task \
    --source ./raw-schema \
    --stage-bucket bjwilcox-ba882-fall25-functions \
    --service-account sa-bjwilcox-ba882-fall25@bjwilcox-ba882-fall25.iam.gserviceaccount.com \
    --region us-central1 \
    --allow-unauthenticated \
    --memory 512MB 

echo "======================================================"
echo "deploying the scoreboard extractor"
echo "======================================================"

gcloud functions deploy raw-extract-scoreboard \
    --gen2 \
    --runtime python312 \
    --trigger-http \
    --entry-point task \
    --source ./raw-extract-scoreboard \
    --stage-bucket bjwilcox-ba882-fall25-functions \
    --service-account sa-bjwilcox-ba882-fall25@bjwilcox-ba882-fall25.iam.gserviceaccount.com \
    --region us-central1 \
    --allow-unauthenticated \
    --memory 512MB 

echo "======================================================"
echo "deploying the scoreboard file parser/ingestor"
echo "======================================================"

gcloud functions deploy raw-load-scoreboard \
    --gen2 \
    --runtime python312 \
    --trigger-http \
    --entry-point task \
    --source ./raw-parse-scoreboard \
    --stage-bucket bjwilcox-ba882-fall25-functions \
    --service-account sa-bjwilcox-ba882-fall25@bjwilcox-ba882-fall25.iam.gserviceaccount.com \
    --region us-central1 \
    --allow-unauthenticated \
    --memory 512MB 