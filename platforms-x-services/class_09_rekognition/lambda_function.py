import json
import requests
import boto3
from io import BytesIO
from PIL import Image


def lambda_handler(event, context):

    print(f'context: {context}')
    print(f'event: {event}')

    image = event['image']
    print(f'image: {image}')

    response = requests.get(image)
    img_bytes = Image.open(BytesIO(response.content))

    client = boto3.client("rekognition")

    response = client.detect_labels(
        Image={'Bytes': img_bytes}, MaxLabels=10, MinConfidence=60)

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
