from azure.servicebus import ServiceBusService, Message, Topic
import argparse


parser = argparse.ArgumentParser(add_help=True)
parser.add_argument('-s', type=str, help="subscriptionNAME")
parser.add_argument('-k', type=str, help="namespaceKEY")
parser.add_argument('-t', type=str, help="topicNAME")
parser.add_argument('-ns', type=str, help="namespaceNAME")
args = parser.parse_args()

bus_service = ServiceBusService(
    service_namespace=args.ns,
    shared_access_key_name='RootManageSharedAccessKey',
    shared_access_key_value=args.k)



flag = True
while flag:
    msg = bus_service.receive_subscription_message(args.t, args.s, peek_lock=True)
    if msg.body is not None:
            msg.delete()
    else:
        Flag = False
        print ('We are done here')
        break
