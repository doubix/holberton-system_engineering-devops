#!/usr/bin/python3
"""
Using what you did in the task #0, extend your Python
script to export data in the JSON format.s
"""

import json
import requests

if __name__ == '__main__':
    url = "https://jsonplaceholder.typicode.com/users"
    users = requests.get(url, verify=False).json()
    username_doc = {}
    user_doc = {}
    for user in users:
        uid = user.get("id")
        user_doc[uid] = []
        username_doc[uid] = user.get("username")
    url = "https://jsonplaceholder.typicode.com/todos"
    todo = requests.get(url, verify=False).json()
    [user_doc.get(t.get("userId")).append({"task": t.get("title"),
                                           "completed": t.get("completed"),
                                           "username": username_doc.get(
                                               t.get("userId"))})
     for t in todo]
    with open("todo_all_employees.json", 'w') as jsonfile:
        json.dump(user_doc, jsonfile)
