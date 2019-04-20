#processes frontend requests
#get json -> get relevant data
#send request back to frontend
import sqlite3
import json
import yelp_api as yelp_api

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
    #Jennifer's JSON {Location: Berkeley}
    #{Message Type: "Location", Message: "Berkeley"}
    #Message type: Location, Category, Extra: [Price, Category]
    #yelp_call(json['Location'], json['Category1'], json['Category2'], json['Price'])
    return jsonify(yelp_call(json['Location'], json['Category'], json['Price']))


    #else:
    #    return jsonify({'messages': "Seems like your location settings are off. :( Would you mind giving the city you are located in? \n"})
		#check_database()

#@app.route('/test', methods = ['GET'])
#def test():
#    return jsonify(message = "hello world")


if __name__ == '__main__':
    main()
