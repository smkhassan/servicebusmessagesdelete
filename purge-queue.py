from azure.servicebus import QueueClient, Message
import argparse


parser = argparse.ArgumentParser(add_help=True)
parser.add_argument('-c', type=str, help="ConnectionString")
parser.add_argument('-q', type=str, help="Queue")
args = parser.parse_args()

# Create the QueueClient
queue_client = QueueClient.from_connection_string(
    args.c, args.q)

# Receive the message from the queue
with queue_client.get_receiver() as queue_receiver:
    messages = queue_receiver.fetch_next(timeout=3, peek_lock=True)
    for message in messages:
        message.delete()
