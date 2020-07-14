#!/usr/bin/python3

import requests

# quantifycrypto.net API keys
headers = {
        'Qc-Access-Key-Id': '44TZX4JVBQYQDDU011FY',
        'Qc-Secret-Key': '6BxC3IVHksS6kEUoLGCi6fkoXWG3nVkAyN1dJebCtl4='
        }

url = "https://quantifycrypto.net/api/v1.0-beta/coin/btc"
data = requests.get(url, headers=headers).json()
print('%s%.2f' % ("BTC:".ljust(15), data[u'price_usd']))

url = "https://quantifycrypto.net/api/v1.0-beta/coin/eth"
data = requests.get(url, headers=headers).json()
print('%s%.2f' % ("ETH:".ljust(15), data[u'price_usd']))

url = "https://quantifycrypto.net/api/v1.0-beta/coin/ltc"
data = requests.get(url, headers=headers).json()
print('%s%.2f' % ("LTC:".ljust(15), data[u'price_usd']))

url = "https://quantifycrypto.net/api/v1.0-beta/coin/atom"
data = requests.get(url, headers=headers).json()
print('%s%.4f' % ("ATOM:".ljust(13), data[u'price_usd']))

url = "https://quantifycrypto.net/api/v1.0-beta/coin/erd"
data = requests.get(url, headers=headers).json()
print('%s%.4f' % ("ERD:".ljust(15), data[u'price_usd']))
