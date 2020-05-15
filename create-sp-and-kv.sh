#!/bin/bash

RESOURCE_GROUP="lroCapitalWasteland"
RESOURCE_GROUP_REGION="EastUS"
KEYVAULT_NAME="lroVault101"
SP_NAME="http://vaultDweller"

echo "Creating resource group..."
az group create -n $RESOURCE_GROUP -l $RESOURCE_GROUP_REGION
echo "Creating Keyvault..."
az keyvault create -n $KEYVAULT_NAME -g $RESOURCE_GROUP
echo "Creating service principal"
az ad sp create-for-rbac -n $SP_NAME --sdk-auth
echo "Setting policy"
az keyvault set-policy -n $KEYVAULT_NAME --spn $SP_NAME --key-permissions sign verify
echo "Done..."
