#!/bin/zsh

echo "Generating env config files"

cat <<EOT >> apps/app_core/.env.dev
BASE_API_URL=https://jsonplaceholder.typicode.com/
USER_API_URL=https://reqres.in/
ENV=Development
IOS_APP_STORE_ID=123333
ONESIGNAL_APP_ID=123456
EOT


cat <<EOT >> apps/app_core/.env.prod
BASE_API_URL=https://jsonplaceholder.typicode.com/
USER_API_URL=https://reqres.in/
ENV=Production
IOS_APP_STORE_ID=123333
ONESIGNAL_APP_ID=123456
EOT

cat <<EOT >> apps/app_core/.env.staging
BASE_API_URL=https://jsonplaceholder.typicode.com/
USER_API_URL=https://reqres.in/
ENV=Staging
IOS_APP_STORE_ID=123333
ONESIGNAL_APP_ID=123456
EOT

melos bs

echo "Generate build runner files"
melos run build-runner

echo "Generate asset files"
melos run asset-gen

echo "Generate locale files"
melos run locale-gen

echo "Enabling Git Hooks"
dart run husky install

echo "Activating mason_cli"
dart pub global activate mason_cli

echo "Initialising mason"
dart pub global activate mason
mason init

echo "Installing mason bricks"
echo "bricks:\n  feature:\n    path: bricks/feature" > mason.yaml
mason get feature

echo "Generating WidgetBook"
melos run widgetbook-gen
