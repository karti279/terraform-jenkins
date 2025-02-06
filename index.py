import boto3
import os

def handler(event, context):
    volume_id = os.environ['VOLUME_ID']
    ec2 = boto3.client('ec2')

    response = ec2.create_snapshot(
        VolumeId=volume_id,
        Description=f"Daily snapshot of {volume_id}"
    )

    print(f"Snapshot created: {response['SnapshotId']}")
    return {
        'statusCode': 200,
        'body': f"Snapshot created: {response['SnapshotId']}"
    }

