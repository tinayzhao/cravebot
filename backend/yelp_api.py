from yelpapi import YelpAPI
import json

yelp_api = YelpAPI("Hp8pY32pxeXSNL8oAaQIRHT2cKs4A711Jn-5cJof-rSE1SicUkneft1NKY_gdHk8mJoCMVY7iZARi13lqYCgpz65MXqYwN6vBqYpAnBovBbxN45Vf-u0MNdjgMAvXHYx")

def yelp_call(*args):
    users_location = args[0]
    users_term = args[1]
    users_price = args[2]
    limit = 10

    bool_location = users_location != ""
    bool_term = users_term != ""
    bool_price = users_price != ""
    if bool_location and not bool_term and not bool_price:
        try:
            response = yelp_api.search_query(location = users_location)
            retlst = []
            limit = min(limit, len(response['businesses']))

            for i in range (limit):
                dict = {}
                dict['name'] = response['businesses'][i]['name']
                dict['image_url'] = response['businesses'][i]['image_url']
                dict['rating'] = response['businesses'][i]['rating']
                dict['location'] = response['businesses'][i]['location']
                dict['distance'] = response['businesses'][i]['distance']/1609.34
                dict['price'] = response['businesses'][i]['price']
                dict['is_open'] = not response['businesses'][i]['is_closed']
                #print(dict)
                retlst.append(dict)
            print(retlst)
            return retlst
        except:
            dict = {}
            dict['error'] = 'location'
            print("You gave us an invalid location!")
            print(dict)
            return [dict]
    elif bool_location and bool_term and not bool_price:
        try:
            response = yelp_api.search_query(location = users_location, term = users_term)
            retlst = []
            limit = min(limit, len(response['businesses']))

            for i in range (limit):
                dict = {}
                dict['name'] = response['businesses'][i]['name']
                dict['image_url'] = response['businesses'][i]['image_url']
                dict['rating'] = response['businesses'][i]['rating']
                dict['location'] = response['businesses'][i]['location']
                dict['distance'] = response['businesses'][i]['distance']/1609.34
                dict['price'] = response['businesses'][i]['price']
                dict['is_open'] = not response['businesses'][i]['is_closed']
                #print(dict)
                retlst.append(dict)
            print(retlst)
            return retlst

        except:
            dict = {}
            dict['error'] = 'term'
            print("You gave us an invalid food!")
            print(dict)
            return [dict]
    elif bool_location and bool_term and bool_price:
        try:
            response = yelp_api.search_query(location = users_location, term = users_term, price = users_price)
            retlst = []
            limit = min(limit, len(response['businesses']))

            for i in range (limit):
                dict = {}
                dict['name'] = response['businesses'][i]['name']
                dict['image_url'] = response['businesses'][i]['image_url']
                dict['rating'] = response['businesses'][i]['rating']
                dict['location'] = response['businesses'][i]['location']
                dict['distance'] = response['businesses'][i]['distance']/1609.34
                dict['price'] = response['businesses'][i]['price']
                dict['is_open'] = not response['businesses'][i]['is_closed']
                #print(dict)

                retlst.append(dict)
            print(retlst)
            return retlst
        except:
            dict = {}
            dict['error'] = 'price'
            print("You gave us an invalid price!")
            print(dict)
            return [dict]
