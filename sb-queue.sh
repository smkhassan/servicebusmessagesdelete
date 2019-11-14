az login --use-device-code
az account set -s "Your Subscription"

# TODO - set your own list of service bus namespaces
# # namespaceNAMES= 'examplesb examplesb2 examplesb3'

for namespaceNAME in $namespacesNAMES
do
    queueConnectionString=$(az servicebus namespace authorization-rule keys list --name "RootManageSharedAccessKey" --namespace-name "$namespaceNAME" --resource-group "$namespaceNAME-rg" --query primaryConnectionString -o tsv )
    for queueNAME in $(az servicebus queue list -g "$namespaceNAME-rg" --namespace-name "$namespaceNAME" --query [].name -o tsv)
    do
      # ./purge-queue.py -q $queueNAME -c $queueConnectionString
      echo "queue $queueNAME: purger is disabled"
    done
done
