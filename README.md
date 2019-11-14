### Installation

Purger-servicebus requires [Python3](https://www.python.org/downloads/) Python 3.7.4

Install the dependencies

```sh
$ pip install azure-servicebus==0.21.1
```
**Free Software, Hell Yeah!**

**Use this Script to Delete Messages from Microsoft Azure Cloud Service Bus Topics or Queue without delete the resource!**

### Usage
- Please set your subscription in code ```az account set -s "Your Subscription" ```
- Please define `namespaceNAMES` in code and uncomment it the namespaces for topic or queue in both scripts `sb-topic.sh` and `sb-queue.sh` depends on which one you want to use.
  - ``` namespaceNAMES='abdelv-app-svcbus abdelv-cbs-svcbus abdelv-cpg-svcbus'```
- Uncomment Python Script in order to purge otherwise the script is going to just list in both scripts `sb-topic.sh` and `sb-queue.sh` depends on which one you want to use.
  -  ```./purge-queue.py -q $queueNAME -c $queueConnectionString```
- Please check if messages where deleted by going to portal and check content of messages.
