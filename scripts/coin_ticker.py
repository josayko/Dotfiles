#!/usr/bin/python3

import requests

# https://quantifycrypto.com API keys
headers = {
        'Qc-Access-Key-Id': # your access key,
        'Qc-Secret-Key': # your secret key
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
