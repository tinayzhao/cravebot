#processes frontend requests
#get json -> get relevant data
#send request back to frontend
import sqlite3
import json
from yelp_api import yelp_call
from nlp import check

from flask import Flask, request, jsonify


app = Flask(__name__)

'''Example
@app.route('/api/get_messages', methods = ['POST'])
def get_messages():
    json = request.get_json()
    if json['user'] == "larry":
        return jsonify({'messages':['test1', 'test2']})
    return jsonify({'error':'no user found'})
'''

@app.route('/api/backend', methods = ['POST'])
def main():
    json = request.get_json()
    mispelled_words = check(json['Location'], json['Category'])
    if len(mispelled_words) > 0:
        return jsonify(mispelled_words)
    else:
        return jsonify(yelp_call(json['Location'], json['Category'], price_conversion(json['Price'])))

def price_conversion(str):
    retStr = "1"
    num = int(str)
    if num < 30:
        retStr += ", 2"
    elif num < 60:
        retStr += ", 2, 3"
    else:
        retStr += ", 2, 3, 4"
    return retStr


if __name__ == '__main__':
    main()
