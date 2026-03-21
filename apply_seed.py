import requests
import json
import sys

url = "https://api.supabase.com/v1/projects/usuddhrjldeytjqlazpi/database/query"
headers = {
    "Authorization": "Bearer sbp_d8890f4ca2ffba30ee7a2d775682ec3a89939bf4",
    "Content-Type": "application/json"
}

try:
    with open("populate_database.sql", "r", encoding="utf-8") as f:
        sql_content = f.read()
        
    data = {
        "query": sql_content
    }

    print("Sending query to Supabase Management API...")
    response = requests.post(url, headers=headers, json=data)
    
    print(f"Status Code: {response.status_code}")
    if response.status_code != 200 and response.status_code != 201:
        print("Error:")
        print(response.text)
        sys.exit(1)
    else:
        print("Successfully executed SQL!")
except Exception as e:
    print(f"Failed: {e}")
    sys.exit(1)
