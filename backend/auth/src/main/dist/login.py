import json
import boto3

def lambda_handler(event, context):
    client = boto3.client('cognito-idp')

    try:
        response = client.initiate_auth(
            AuthFlow='USER_PASSWORD_AUTH',
            AuthParameters={
                'USERNAME': event['username'],
                'PASSWORD': event['password']
            },
            ClientId='your_app_client_id'
        )

        return {
            'statusCode': 200,
            'body': json.dumps({
                'id_token': response['AuthenticationResult']['IdToken'],
                'access_token': response['AuthenticationResult']['AccessToken'],
                'refresh_token': response['AuthenticationResult']['RefreshToken']
            })
        }

    except client.exceptions.NotAuthorizedException:
        return {
            'statusCode': 401,
            'body': json.dumps('Invalid username or password')
        }
    except client.exceptions.UserNotFoundException:
        return {
            'statusCode': 404,
            'body': json.dumps('User not found')
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps(str(e))
        }
