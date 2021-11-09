import json
import datetime as dt


def main(event, context):
    body = {
        "message": "Function executed successfully!",
        "Output": timenow(),
    }

    try:
        
        print(timenow())

    except Exception as ex:

        print(ex)
        

    response = {"statusCode": 200, "body": json.dumps(body)}
    return response
    
def timenow():

    dateTimeObj = dt.datetime.now()
    date = dateTimeObj.strftime("%d-%b-%Y_%H-%M-%S")
    
    return date

if __name__ == '__main__':
    main('{}','{}')