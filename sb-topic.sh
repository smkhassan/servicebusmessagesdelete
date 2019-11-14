az login --use-device-code
az account set -s "Your Subscription"

# TODO - set your own list of service bus namespaces
# # namespaceNAMES= 'examplesb examplesb2 examplesb3'

for namespaceNAME in $namespaceNAMES
do
  namespaceKEY=$(az servicebus namespace authorization-rule keys list --name "RootManageSharedAccessKey" --namespace-name "$namespaceNAME" --resource-group "$namespaceNAME-rg" --query primaryKey -o tsv )
        for topicNAME in $(az servicebus topic list -g "$namespaceNAME-rg" --namespace-name "$namespaceNAME" --query [].name -o tsv)
        do
          for subscriptionNAME in $(az servicebus topic subscription list --resource-group "$namespaceNAME-rg" --namespace-name "$namespaceNAME" --topic-name "$topicNAME" --query [].name -o tsv)
          do
            echo "purger is disabled"
            # ./purge-topic.py -s $subscriptionNAME -k $namespaceKEY -t $topicNAME -ns $namespaceNAME
          done
    done
done
