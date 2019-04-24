import json
from yelp_api import yelp_call
from nlp import check

from flask import Flask, request, jsonify


app = Flask(__name__)

@app.route('/api/backend', methods = ['POST'])
def main():
    json = request.get_json()
    ret = {}
    misspelled_words = check(json['location'], json['category'])
    if len(misspelled_words) > 0:
        msg = "Perhaps you meant to type "
        for i in range(len(misspelled_words)):
            for j in range(len(misspelled_words[i])):
                msg += misspelled_words[i][0].capitalize() + " instead?"
                break
        ret['message'] = msg
        ret['restaurants'] = []
    else:
        ret['restaurants'] = yelp_call(json['location'], json['category'], price_conversion(json['price']))
        ret['message'] = ""
    return jsonify(ret)

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
