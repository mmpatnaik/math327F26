#!/bin/sh
# Build locally, then upload ordinary static files to a public_html server.
set -eu

cd "$(dirname "$0")"

if [ ! -f deploy.conf ]; then
  echo "Missing deploy.conf. Copy deploy.conf.example to deploy.conf and add your server details."
  exit 1
fi

. ./deploy.conf
: "${DEPLOY_HOST:?DEPLOY_HOST is required}"
: "${DEPLOY_PATH:?DEPLOY_PATH is required}"

case "$DEPLOY_PATH" in
  public_html/*/) ;;
  *) echo "DEPLOY_PATH must look like public_html/course-name/"; exit 1 ;;
esac

python3 build.py
echo "Uploading _site/ to ${DEPLOY_HOST}:${DEPLOY_PATH}"
rsync -avz --exclude '.DS_Store' _site/ "${DEPLOY_HOST}:${DEPLOY_PATH}"
echo "Upload complete."

