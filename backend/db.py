import sqlite3

sqlite_file = 'crave_db_sqlite'
conn = sqlite3.connect(sqlite_file)
cur = conn.cursor()

#takes in an dictionary of {column name: value} and updates the database with it
def main(info):
    initalize_db()
    uid = info[user_id]
    loc = info[location]
    foodType = info[type]
    price = info[max_price]
    # userExist = False
    cur.execute("SELECT user_id FROM current_search WHERE user_id = ?", (uid,))
    data = cursor.fetchall()
    if len(data) != 0:
        conn.row_factory = dict_factory
        cur.execute("SELECT location, max_price, type FROM current_search WHERE user_id = ?", (uid,))
        oldInfo = cursor.fetchone()
        

        for i in range(len(oldInfo)):
            if info[]


        #if user exist logic
        # userExist = True

    else:
        cur.execute("INSERT into current_search values(?,?,?,?)", (uid, loc, price, foodType))
    #check if corresponding user id is in the TABLE
        #if not create row with that id
        #else: update that row with info
        #if too much info (more than 2 food types) send a request back to frontend to tell user to delete something?

def dict_factory(cursor, row):
    d = {}
    for idx, col in enumerate(cursor.description):
        d[col[0]] = row[idx]
    return d

#helper function to intialize database
def initialize_db():
    cur.execute("CREATE TABLE IF NOT EXISTS current_search (
    user_id integer PRIMARY KEY,
    location text NOT NULL,
    max_price float NOT NULL,
    type text NOT NULL,
    type2 text
    )")