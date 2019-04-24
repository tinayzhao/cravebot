import json
from yelp_api import yelp_call
from nlp import check

from flask import Flask, request, jsonify


app = Flask(__name__)

@app.route('/api/backend', methods = ['POST'])
def main():
    json = request.get_json()
    misspelled_words = check(json['location'], json['category'])
    if len(misspelled_words) > 0:
        return jsonify(mispelled_words)
    else:
        return jsonify(yelp_call(json['location'], json['category'], price_conversion(json['price'])))

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
