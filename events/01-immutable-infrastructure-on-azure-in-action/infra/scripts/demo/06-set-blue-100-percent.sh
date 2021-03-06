#!/usr/bin/env bash

environment=dev
tfmResourceGroupName="iac-$environment-rg"
tfmProfileName="iac-$environment-tfm"

echo -e "Set iac-dev-blue-api to 100%"
az network traffic-manager endpoint update -g ${tfmResourceGroupName} --profile-name ${tfmProfileName} -n iac-dev-blue-api --type azureEndpoints --endpoint-status enabled --weight 100

echo -e "Disable iac-dev-api"
az network traffic-manager endpoint update -g ${tfmResourceGroupName} --profile-name ${tfmProfileName} -n iac-dev-api  --type azureEndpoints --endpoint-status disabled --weight 1


