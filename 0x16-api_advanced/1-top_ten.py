#!/usr/bin/python3
"""
Define: top_ten function
"""

import requests


def top_ten(subreddit):
    """Displays the titles of the 10 hot posts for a given subreddit

    Arguments:
        subreddit (str)

    Returms
        None
    """
    if subreddit is None or type(subreddit) is not str:
        print(None)

    url = 'http://www.reddit.com/r/{}/hot.json'.format(subreddit)
    headers = {
        'User-Agent': 'Python/requests:api.advanced:v1.0.0 (by /u/aleix)'}
    params = {'limit': 10}
    req = requests.get(url, headers=headers, params=params).json()
    posts = req.get('data', {}).get('children', None)
    if posts is None or (len(posts) > 0 and posts[0].get('kind') != 't3'):
        print(None)
    else:
        for post in posts:
            print(post.get('data', {}).get('title', None))
