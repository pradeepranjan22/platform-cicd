import json


def handler(event, context):
    """Minimal endpoint that a CI/CD system can call after a deployment."""
    return {
        "statusCode": 200,
        "headers": {"content-type": "application/json"},
        "body": json.dumps(
            {
                "message": "CI/CD lab hook is ready",
                "requestId": context.aws_request_id,
            }
        ),
    }
