#!/usr/bin/python3
"""Function to count words in all hot posts of a given Reddit subreddit."""
import requests


def count_words(subreddit, word_list, after="", doc={}, count=0):
    """Prints counts of given words found in hot posts of a given subreddit.

    Arguments:
        subreddit (str)
        word_list (list)
        after (str)
        doc (obj)
        count (int)

    Returns:
        None
    """
    url = "https://www.reddit.com/r/{}/hot/.json".format(subreddit)
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/aleix)"
    }
    params = {"after": after, "count": count, "limit": 100}
    res = requests.get(url, headers=headers, params=params,
                       allow_redirects=False)

    if (res.status_code != 200 or "error" in res.json().keys()):
        print("")
        return None
