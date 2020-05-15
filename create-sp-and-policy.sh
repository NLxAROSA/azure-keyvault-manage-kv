#!/bin/bash

echo "Creating service principal"
az ad sp create-for-rbac -n $SP_NAME --sdk-auth > sp.json
echo "Setting policy"
az keyvault set-policy -n $KEYVAULT_NAME --spn $SP_NAME --key-permissions sign verify > policy.json
echo "SP Output:"
cat sp.json
echo "Policy output:"
cat policy.json
