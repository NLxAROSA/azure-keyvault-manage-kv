#!/bin/bash

echo "Adding plugin repo..."
cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org
echo "Installing SCS plugin..."
cf install-plugin -r CF-Community "spring-cloud-services"
echo "Logging in..."
cf login -a $CF_URL -u $CF_USER -p $CF_PASSWORD
echo "Adding secret to Credhub..."
cf config-server-add-credhub-secret my-config-server signing-demo/cloud/master/myprop '{"kid":"$KID","clientId":"$CLIENT_ID","clientSecret":"$CLIENT_SECRET"}'
echo "Done..."