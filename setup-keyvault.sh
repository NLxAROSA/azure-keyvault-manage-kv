#!/bin/bash

echo "Creating resource group..."
az group create -n $RESOURCE_GROUP -l $RESOURCE_GROUP_REGION
echo "Creating Keyvault..."
az keyvault create -n $KEYVAULT_NAME -g $RESOURCE_GROUP
echo "Creating key..."
az keyvault key create -n $KEY_NAME --vault-name $KEYVAULT_NAME --kty rsa
echo "Exporting environment variables"
az keyvault key list --vault-name $KEYVAULT_NAME > key.json
for keyval in $(grep -E '": [^\{]' key.json | sed -e 's/: /=/' -e "s/\(\,\)$//" | sed 's/\"//g'); do
    echo "export $keyval"
    export $keyval
done

echo "##vso[task.setvariable variable=kid]$KID"
