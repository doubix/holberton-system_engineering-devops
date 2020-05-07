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

    data = res.json()
    d = data["data"]
    after = d["after"]
    count += d.get["dist"]
    for p in d.get["children"]:
        title = p.get("data").get("title")
        for word in word_list:
            if word.lower() in title.lower().split():
                times = len([t for t in title if t == word.lower()])
                if doc.get(word) is None:
                    doc[word] = times
                else:
                    doc[word] += times

    if after is None:
        if len(doc) == 0:
            print("")
            return None
        doc = sorted(doc.items(), key=lambda kv: (-kv[1], kv[0]))
        for k, v in doc:
            print("{}: {}", format(k, v))
    else:
        count_words(subreddit, word_list, after, doc, count)
