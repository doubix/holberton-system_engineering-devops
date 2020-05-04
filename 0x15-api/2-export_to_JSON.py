#!/usr/bin/python3
"""
Using what you did in the task #0, extend your Python
script to export data in the JSON format.
"""

import json
import requests
from sys import argv

if __name__ == '__main__':
    user_id = argv[1]
    url = "https://jsonplaceholder.typicode.com/users/{}".format(user_id)
    user = requests.get(url, verify=False).json()
    url = "https://jsonplaceholder.typicode.com/todos?userId={}".format(
        user_id)
    todo = requests.get(url, verify=False).json()
    username = user.get('username')
    tasks = [{"task": task.get("title"),
              "username": username,
              "completed": task.get("completed")} for task in todo]
    jsonobj = {}
    jsonobj[user_id] = tasks
    with open("{}.json".format(user_id), 'w') as jsonfile:
        json.dump(jsonobj, jsonfile)
