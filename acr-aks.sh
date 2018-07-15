#!/bin/bash

AKS_RESOURCE_GROUP=Docker-Test
AKS_CLUSTER_NAME=gokul-k8s
ACR_RESOURCE_GROUP=Docker-Test
ACR_NAME=gokulpersonal

# Get the id of the service principal configured for AKS
CLIENT_ID=$(az aks show --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --query "servicePrincipalProfile.clientId" --output tsv)
echo $CLIENT_ID
# Get the ACR registry resource id
ACR_ID=$(az acr show --name $ACR_NAME --resource-group $ACR_RESOURCE_GROUP --query "id" --output tsv)
echo $ACR_ID
# Create role assignment
az role assignment create --assignee $CLIENT_ID --role Reader --scope $ACR_ID
