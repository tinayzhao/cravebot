#processes frontend requests
#get json -> get relevant data
#send request back to frontend
import sqlite3
import json
import db as db

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

@app.route('/api/get_messages', methods = ['POST'])
def main():
    json = request.get_json()
    json_keys = json.keys()
	#store json in database
	#if nothing, will change once i see the json format:
    if json is None:
        return flask.json.jsonify(messages =  "Hi. I'm Cravebot. <3 What are you craving today?")
        return flask.json.jsonify({'messages': "Hi. I'm Cravebot. <3 What are you craving today?"})
    else:
        #return message if location is missing
        db.check_location()


    #else:
    #    return jsonify({'messages': "Seems like your location settings are off. :( Would you mind giving the city you are located in? \n"})
		#check_database()

#@app.route('/test', methods = ['GET'])
#def test():
#    return jsonify(message = "hello world")



def check_database():
	sqlite_file = 'crave_db.sqlite'
	conn = sqlite3.connect(sqlite_file)
	cur = conn.cursor()
	create_table("Responses", ["Food", "Location", "Descriptors"], ['TEXT', 'TEXT', 'TEXT'])



def create_table(table_name, columns, types):
	command = 'CREATE TABLE if not exists {tn} ({fc} {ft},'.format(tn = table_name, fc = columns[0], ft = types[0])
	for i in range(1, len(columns)):
		command += '{c} {t}'.format(c = columns[i], t = types[i])
		if i != len(columns) - 1:
			command += ','
	command += ')'
	cur.execute(command)
	conn.commit()



















if __name__ == '__main__':

    main()
