import feedparser


def get_feed(url):
    return feedparser.parse(url)

def get_feed_with_comments(url):
    result = []
    feed = feedparser.parse(url)
    for entry in feed['entries']:
        entry_item = {
            "author": entry['author'],
            "text"  : [item['value'] for item in entry['content']],
            'comments': []
        }
        for link in entry['links']:
            comments = feedparser.parse(link['href'] + '.rss')
            for comment in comments['entries']:
                if 'author' in comment and 'content' in comment:
                    entry_item['comments'].append({
                        "author": comment['author'],
                        "text"  : [item['value'] for item in comment['content']],
                    })
        result.append(entry_item)
    
    return result
            

    


if __name__ == "__main__":
    get_feed_with_comments("https://www.reddit.com/r/stocks/.rss")