#!/bin/bash

echo "Creating key..."
az keyvault key create -n $KEY_NAME --vault-name $KEYVAULT_NAME --kty rsa
echo "Done..."
