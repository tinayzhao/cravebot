from yelpapi import YelpAPI
import json

yelp_api = YelpAPI("Hp8pY32pxeXSNL8oAaQIRHT2cKs4A711Jn-5cJof-rSE1SicUkneft1NKY_gdHk8mJoCMVY7iZARi13lqYCgpz65MXqYwN6vBqYpAnBovBbxN45Vf-u0MNdjgMAvXHYx")

def yelp_call(*args):
    users_location = args[0]
    users_term = args[1]
    users_price = args[2]
    limit = 5

    bool_location = users_location != ""
    bool_term = users_term != ""
    bool_price = users_price != ""
    if bool_location and not bool_term and not bool_price:
        try:
            response = yelp_api.search_query(location = users_location)
            retlst = []
            limit = min(limit, len(response))

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
            limit = min(limit, len(response))

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
            response = yelp_api.search_query(location = users_location)
            retlst = []
            limit = min(limit, len(response))

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


    #     try:
    #         response = yelp_api.search_query(location = users_location, term = users_term, price = users_price)
    #
    #         retlst = []
    #         limit = min(limit, len(response))
    #
    #         for i in range (limit):
    #             dict = {}
    #             dict['name'] = response['businesses'][i]['name']
    #             dict['image_url'] = response['businesses'][i]['image_url']
    #             dict['rating'] = response['businesses'][i]['rating']
    #             dict['location'] = response['businesses'][i]['location']
    #             dict['distance'] = response['businesses'][i]['distance']/1609.34
    #             dict['price'] = response['businesses'][i]['price']
    #             dict['is_open'] = not response['businesses'][i]['is_closed']
    #             #print(dict)
    #             retlst.append(dict)
    #         #print(retlst)
    #         jsonVersion = json.dumps(dict)
    #         print(json.loads(jsonVersion))
    #
    #     except:
    #         dict = {}
    #         dict['error'] = 'food'
    #         print("You gave us an invalid type of food!")
    #         print(dict)
    # except:


yelp_call("Berkeley", "Korean", "")
# Name
# Image
# Rating -> convert this stars
# Address
# Distance -> convert to displayable data
# Open or not / business hours

# print("")


# response = yelp_api.business_match_query(name='Splash Cafe',
#                                          address1='197 Pomeroy Ave',
#                                          city='Pismo Beach',
#                                          state='CA',
#                                          country='US',
#                                          match_type='lookup')
#
# print(response)
# print("")
#
# response = yelp_api.business_match_query(name='Splash Cafe',
#                                          address1='197 Pomeroy Ave',
#                                          city='Pismo Beach',
#                                          state='CA',
#                                          country='US',
#                                          match_type='best')
#
# print(response)
#
# {'businesses':
# [{'id': '-08CAog7QCa1WF_YmINv1g', 'alias': 'icicles-berkeley', 'name': 'ICICLES', 'image_url': 'https://s3-media4.fl.yelpcdn.com/bphoto/Q_of7DakSDPMQHE8c-SMuQ/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/icicles-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 21, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}, {'alias': 'desserts', 'title': 'Desserts'}], 'rating': 4.5, 'coordinates': {'latitude': 37.871161, 'longitude': -122.2746576}, 'transactions': [], 'location': {'address1': '1812 University Ave', 'address2': 'Unit A', 'address3': '', 'city': 'Berkeley', 'zip_code': '94703', 'country': 'US', 'state': 'CA', 'display_address': ['1812 University Ave', 'Unit A', 'Berkeley, CA 94703']}, 'phone': '', 'display_phone': '', 'distance': 290.38177913418133},
# {'id': 'GB2vRHTR0khHq28qoZFSjw', 'alias': 'iscream-berkeley', 'name': 'iScream', 'image_url': 'https://s3-media4.fl.yelpcdn.com/bphoto/twm6ydgJfTlnhImZjmTacw/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/iscream-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 384, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}, {'alias': 'coffee', 'title': 'Coffee & Tea'}, {'alias': 'waffles', 'title': 'Waffles'}], 'rating': 4.5, 'coordinates': {'latitude': 37.891644, 'longitude': -122.279387}, 'transactions': [], 'price': '$', 'location': {'address1': '1819 Solano Ave', 'address2': '', 'address3': '', 'city': 'Berkeley', 'zip_code': '94707', 'country': 'US', 'state': 'CA', 'display_address': ['1819 Solano Ave', 'Berkeley, CA 94707']}, 'phone': '+15103904491', 'display_phone': '(510) 390-4491', 'distance': 2589.0625089512687}, {'id': 'uwvhf3nO353A3Em5AEeO9Q', 'alias': 'gadani-berkeley', 'name': 'Gadani', 'image_url': 'https://s3-media1.fl.yelpcdn.com/bphoto/TheVOEMBUxYd97peX7KgKA/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/gadani-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 307, 'categories': [{'alias': 'coffee', 'title': 'Coffee & Tea'}, {'alias': 'waffles', 'title': 'Waffles'}, {'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}], 'rating': 4.0, 'coordinates': {'latitude': 37.870612, 'longitude': -122.267907}, 'transactions': [], 'price': '$', 'location': {'address1': '139 Berkeley Sq', 'address2': None, 'address3': '', 'city': 'Berkeley', 'zip_code': '94704', 'country': 'US', 'state': 'CA', 'display_address': ['139 Berkeley Sq', 'Berkeley, CA 94704']}, 'phone': '+15108221888', 'display_phone': '(510) 822-1888', 'distance': 668.3219621959456}, {'id': 'nNF1w9SIqX8ACB9JVCoQWg', 'alias': 'uji-time-dessert-berkeley', 'name': 'UJI Time Dessert', 'image_url': 'https://s3-media2.fl.yelpcdn.com/bphoto/iASe08fQ8pGkoH1zAhEhTw/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/uji-time-dessert-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 647, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}], 'rating': 4.0, 'coordinates': {'latitude': 37.8638360387923, 'longitude': -122.258340208659}, 'transactions': [], 'price': '$', 'location': {'address1': '2575 Telegraph Ave', 'address2': '', 'address3': '', 'city': 'Berkeley', 'zip_code': '94704', 'country': 'US', 'state': 'CA', 'display_address': ['2575 Telegraph Ave', 'Berkeley, CA 94704']}, 'phone': '+15106661008', 'display_phone': '(510) 666-1008', 'distance': 1562.8069323671116}, {'id': 'r7Ggh7ejuBWjT0TQPW-ypA', 'alias': 'cream-berkeley-5', 'name': 'CREAM', 'image_url': 'https://s3-media4.fl.yelpcdn.com/bphoto/bHNi2SYg9pISGecbPWreow/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/cream-berkeley-5?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 2259, 'categories': [{'alias': 'desserts', 'title': 'Desserts'}, {'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}, {'alias': 'catering', 'title': 'Caterers'}], 'rating': 4.0, 'coordinates': {'latitude': 37.86721, 'longitude': -122.25858}, 'transactions': [], 'price': '$', 'location': {'address1': '2399 Telegraph Ave', 'address2': None, 'address3': '', 'city': 'Berkeley', 'zip_code': '94704', 'country': 'US', 'state': 'CA', 'display_address': ['2399 Telegraph Ave', 'Berkeley, CA 94704']}, 'phone': '+15106491000', 'display_phone': '(510) 649-1000', 'distance': 1453.5797970592673}, {'id': 'TiK0_5lrHIDraSLzn7dr0Q', 'alias': 'johns-ice-cream-berkeley', 'name': "John's Ice Cream", 'image_url': 'https://s3-media2.fl.yelpcdn.com/bphoto/FnDExBGc1wttD1dc2ky40Q/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/johns-ice-cream-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 640, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}], 'rating': 4.0, 'coordinates': {'latitude': 37.86896, 'longitude': -122.26826}, 'transactions': [], 'price': '$', 'location': {'address1': '2204 Shattuck Ave', 'address2': '', 'address3': '', 'city': 'Berkeley', 'zip_code': '94704', 'country': 'US', 'state': 'CA', 'display_address': ['2204 Shattuck Ave', 'Berkeley, CA 94704']}, 'phone': '+15109810370', 'display_phone': '(510) 981-0370', 'distance': 601.5238910502242}, {'id': 'GhSnAHeAHdiMc7-5HtOmCw', 'alias': 'taras-organic-ice-cream-berkeley', 'name': "Tara's Organic Ice Cream", 'image_url': 'https://s3-media2.fl.yelpcdn.com/bphoto/jOpBfPcVUTo3lklLyKhx6w/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/taras-organic-ice-cream-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 881, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}], 'rating': 4.5, 'coordinates': {'latitude': 37.8517046932426, 'longitude': -122.252382254079}, 'transactions': [], 'price': '$$', 'location': {'address1': '3173 College Ave', 'address2': '', 'address3': '', 'city': 'Berkeley', 'zip_code': '94705', 'country': 'US', 'state': 'CA', 'display_address': ['3173 College Ave', 'Berkeley, CA 94705']}, 'phone': '+15106555014', 'display_phone': '(510) 655-5014', 'distance': 2739.627130926248}, {'id': 'OBAh9hCEKsUfoNAL-0tV2g', 'alias': 'almare-gelato-italiano-berkeley', 'name': 'Almare Gelato Italiano', 'image_url': 'https://s3-media4.fl.yelpcdn.com/bphoto/epOonRkfxvFkz6y-lXPWwg/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/almare-gelato-italiano-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 505, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}, {'alias': 'gelato', 'title': 'Gelato'}], 'rating': 4.5, 'coordinates': {'latitude': 37.86977, 'longitude': -122.26847}, 'transactions': [], 'price': '$', 'location': {'address1': '2170 Shattuck Ave', 'address2': '', 'address3': '', 'city': 'Berkeley', 'zip_code': '94704', 'country': 'US', 'state': 'CA', 'display_address': ['2170 Shattuck Ave', 'Berkeley, CA 94704']}, 'phone': '+15106491888', 'display_phone': '(510) 649-1888', 'distance': 606.7709445599764}, {'id': 'IQmJ9K15sGYw39s1yqY6Dg', 'alias': 'little-gem-belgian-waffles-berkeley', 'name': 'Little Gem Belgian Waffles', 'image_url': 'https://s3-media2.fl.yelpcdn.com/bphoto/sytHM4Na6lQAqwPZBomb2g/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/little-gem-belgian-waffles-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 354, 'categories': [{'alias': 'desserts', 'title': 'Desserts'}, {'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}, {'alias': 'waffles', 'title': 'Waffles'}], 'rating': 4.5, 'coordinates': {'latitude': 37.8656, 'longitude': -122.25882}, 'transactions': ['pickup'], 'price': '$', 'location': {'address1': '2468-A Telegraph Ave', 'address2': '', 'address3': '', 'city': 'Berkeley', 'zip_code': '94704', 'country': 'US', 'state': 'CA', 'display_address': ['2468-A Telegraph Ave', 'Berkeley, CA 94704']}, 'phone': '+15108838922', 'display_phone': '(510) 883-8922', 'distance': 1461.953596784621}, {'id': 'dvukLdSH4LUqQ5jcJJ3uNQ', 'alias': 'marash-turkish-ice-cream-berkeley', 'name': 'Marash Turkish Ice Cream', 'image_url': 'https://s3-media4.fl.yelpcdn.com/bphoto/-Xna5K0MxsuYBI-y3DP0Ig/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/marash-turkish-ice-cream-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 1, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}], 'rating': 5.0, 'coordinates': {'latitude': 37.8677719, 'longitude': -122.2582301}, 'transactions': [], 'location': {'address1': '2528-A Durant Ave', 'address2': None, 'address3': '', 'city': 'Berkeley', 'zip_code': '94704', 'country': 'US', 'state': 'CA', 'display_address': ['2528-A Durant Ave', 'Berkeley, CA 94704']}, 'phone': '+17149252532', 'display_phone': '(714) 925-2532', 'distance': 1532.0848852858574}, {'id': 'sghBc15Z1ti7Thkg2gq20g', 'alias': 'secret-scoop-thai-gelato-and-dessert-cafe-berkeley', 'name': 'Secret Scoop - Thai Gelato & Dessert Cafe', 'image_url': 'https://s3-media4.fl.yelpcdn.com/bphoto/91s26oS-XF8AGrx0E5PORQ/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/secret-scoop-thai-gelato-and-dessert-cafe-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 187, 'categories': [{'alias': 'gelato', 'title': 'Gelato'}, {'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}, {'alias': 'coffee', 'title': 'Coffee & Tea'}], 'rating': 4.5, 'coordinates': {'latitude': 37.87272, 'longitude': -122.27341}, 'transactions': ['pickup', 'delivery'], 'price': '$', 'location': {'address1': '1922 Martin Luther King Jr Way', 'address2': 'Ste B', 'address3': None, 'city': 'Berkeley', 'zip_code': '94704', 'country': 'US', 'state': 'CA', 'display_address': ['1922 Martin Luther King Jr Way', 'Ste B', 'Berkeley, CA 94704']}, 'phone': '+14159392832', 'display_phone': '(415) 939-2832', 'distance': 470.4817834807382}, {'id': 'UZhU78qqN3sWtre-0Pwt1g', 'alias': 'three-twins-ice-cream-berkeley', 'name': 'Three Twins Ice Cream', 'image_url': 'https://s3-media2.fl.yelpcdn.com/bphoto/sGHpmZI-JoLyfR1M-fTwKw/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/three-twins-ice-cream-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 56, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}], 'rating': 4.0, 'coordinates': {'latitude': 37.86975, 'longitude': -122.30024}, 'transactions': [], 'price': '$', 'location': {'address1': '1809 Fourth St', 'address2': 'Ste A', 'address3': None, 'city': 'Berkeley', 'zip_code': '94710', 'country': 'US', 'state': 'CA', 'display_address': ['1809 Fourth St', 'Ste A', 'Berkeley, CA 94710']}, 'phone': '+15106651400', 'display_phone': '(510) 665-1400', 'distance': 2214.697978662086}, {'id': 'ltTQE83zSM9lqfTmz3bbzg', 'alias': 'caravaggio-gelateria-italiana-berkeley', 'name': 'Caravaggio Gelateria Italiana', 'image_url': 'https://s3-media3.fl.yelpcdn.com/bphoto/pQWXkPgnD6MpVCetMKbVzw/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/caravaggio-gelateria-italiana-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 315, 'categories': [{'alias': 'gelato', 'title': 'Gelato'}, {'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}], 'rating': 4.5, 'coordinates': {'latitude': 37.8751218549228, 'longitude': -122.268521988134}, 'transactions': [], 'price': '$', 'location': {'address1': '1797 Shattuck Ave', 'address2': 'Ste C', 'address3': '', 'city': 'Berkeley', 'zip_code': '94709', 'country': 'US', 'state': 'CA', 'display_address': ['1797 Shattuck Ave', 'Ste C', 'Berkeley, CA 94709']}, 'phone': '+15109002401', 'display_phone': '(510) 900-2401', 'distance': 925.4128530477726}, {'id': 'sRo38ncieIz_Riz3nax5rg', 'alias': 'mr-dewies-cashew-creamery-albany', 'name': "Mr Dewie's Cashew Creamery", 'image_url': 'https://s3-media2.fl.yelpcdn.com/bphoto/iiXN7aTdlHNZTncFFxUFEQ/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/mr-dewies-cashew-creamery-albany?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 390, 'categories': [{'alias': 'desserts', 'title': 'Desserts'}, {'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}, {'alias': 'vegan', 'title': 'Vegan'}], 'rating': 4.5, 'coordinates': {'latitude': 37.89027, 'longitude': -122.2980396}, 'transactions': [], 'price': '$', 'location': {'address1': '1116 Solano Ave', 'address2': None, 'address3': '', 'city': 'Albany', 'zip_code': '94706', 'country': 'US', 'state': 'CA', 'display_address': ['1116 Solano Ave', 'Albany, CA 94706']}, 'phone': '+15102259534', 'display_phone': '(510) 225-9534', 'distance': 3140.0688541673912}, {'id': 'uAHNKMsRG3A9-DXp7922DQ', 'alias': 'smitten-ice-cream-oakland-3', 'name': 'Smitten Ice Cream', 'image_url': 'https://s3-media2.fl.yelpcdn.com/bphoto/8JtFiTqNRdbyMGS76D8J1Q/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/smitten-ice-cream-oakland-3?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 709, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}], 'rating': 4.0, 'coordinates': {'latitude': 37.8461514110041, 'longitude': -122.251797624008}, 'transactions': [], 'price': '$$', 'location': {'address1': '5800 College Ave', 'address2': '', 'address3': '', 'city': 'Oakland', 'zip_code': '94618', 'country': 'US', 'state': 'CA', 'display_address': ['5800 College Ave', 'Oakland, CA 94618']}, 'phone': '+15105947630', 'display_phone': '(510) 594-7630', 'distance': 3227.344843780395}, {'id': 'R1pqYB-iunG2c2DvWTmAKw', 'alias': 'lush-gelato-berkeley', 'name': 'Lush Gelato', 'image_url': 'https://s3-media4.fl.yelpcdn.com/bphoto/1oRqqWernzjNiy0PzCRHjg/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/lush-gelato-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 289, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}, {'alias': 'gelato', 'title': 'Gelato'}], 'rating': 4.5, 'coordinates': {'latitude': 37.87981, 'longitude': -122.26889}, 'transactions': [], 'price': '$', 'location': {'address1': '1511 Shattuck Ave', 'address2': '', 'address3': 'Epicurious Garden', 'city': 'Berkeley', 'zip_code': '94709', 'country': 'US', 'state': 'CA', 'display_address': ['1511 Shattuck Ave', 'Epicurious Garden', 'Berkeley, CA 94709']}, 'phone': '+15106660644', 'display_phone': '(510) 666-0644', 'distance': 1362.2696491486865}, {'id': 'ACQxcER6RDR2NOLVu0DHEg', 'alias': 'fentons-creamery-oakland-2', 'name': 'Fentons Creamery', 'image_url': 'https://s3-media3.fl.yelpcdn.com/bphoto/iFq_wRrEgCOsEcSDv-cPMA/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/fentons-creamery-oakland-2?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 4321, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}, {'alias': 'tradamerican', 'title': 'American (Traditional)'}, {'alias': 'desserts', 'title': 'Desserts'}], 'rating': 4.0, 'coordinates': {'latitude': 37.8278770446777, 'longitude': -122.250015258789}, 'transactions': ['pickup'], 'price': '$$', 'location': {'address1': '4226 Piedmont Ave', 'address2': '', 'address3': '', 'city': 'Oakland', 'zip_code': '94611', 'country': 'US', 'state': 'CA', 'display_address': ['4226 Piedmont Ave', 'Oakland, CA 94611']}, 'phone': '+15106587000', 'display_phone': '(510) 658-7000', 'distance': 5034.90021603294}, {'id': 'V3CFqAyBh4lIujrV2luPgg', 'alias': 'endless-summer-sweets-berkeley-2', 'name': 'Endless Summer Sweets', 'image_url': 'https://s3-media2.fl.yelpcdn.com/bphoto/j6kdXmOCPLuFYu_3jSIulw/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/endless-summer-sweets-berkeley-2?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 296, 'categories': [{'alias': 'desserts', 'title': 'Desserts'}, {'alias': 'gourmet', 'title': 'Specialty Food'}], 'rating': 4.5, 'coordinates': {'latitude': 37.8661251, 'longitude': -122.2680387}, 'transactions': [], 'price': '$', 'location': {'address1': '2370 Shattuck Ave', 'address2': '', 'address3': '', 'city': 'Berkeley', 'zip_code': '94704', 'country': 'US', 'state': 'CA', 'display_address': ['2370 Shattuck Ave', 'Berkeley, CA 94704']}, 'phone': '+15103564130', 'display_phone': '(510) 356-4130', 'distance': 677.4247300740658}, {'id': 'la_65qCL_fySntbGQljRAA', 'alias': 'curbside-creamery-oakland', 'name': 'Curbside Creamery', 'image_url': 'https://s3-media2.fl.yelpcdn.com/bphoto/pksFvSwTHyl-DqJ3iZw5Bw/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/curbside-creamery-oakland?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 388, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}], 'rating': 4.0, 'coordinates': {'latitude': 37.83613, 'longitude': -122.26187}, 'transactions': [], 'price': '$', 'location': {'address1': '482 49th St', 'address2': '', 'address3': '', 'city': 'Oakland', 'zip_code': '94609', 'country': 'US', 'state': 'CA', 'display_address': ['482 49th St', 'Oakland, CA 94609']}, 'phone': '+15102509804', 'display_phone': '(510) 250-9804', 'distance': 3796.697492087299}, {'id': 'LNdmk-ZXmTE8a2xQGL3OeQ', 'alias': 'yogurt-park-berkeley', 'name': 'Yogurt Park', 'image_url': 'https://s3-media2.fl.yelpcdn.com/bphoto/7cEuZQ_DXhxHRBwXxrN6QA/o.jpg', 'is_closed': False, 'url': 'https://www.yelp.com/biz/yogurt-park-berkeley?adjust_creative=NX_mnnk1tq2inmAABIy0tg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=NX_mnnk1tq2inmAABIy0tg', 'review_count': 737, 'categories': [{'alias': 'icecream', 'title': 'Ice Cream & Frozen Yogurt'}], 'rating': 4.0, 'coordinates': {'latitude': 37.8679885864258, 'longitude': -122.259841918945}, 'transactions': [], 'price': '$', 'location': {'address1': '2433 Durant Ave', 'address2': 'Ste A', 'address3': '', 'city': 'Berkeley', 'zip_code': '94704', 'country': 'US', 'state': 'CA', 'display_address': ['2433 Durant Ave', 'Ste A', 'Berkeley, CA 94704']}, 'phone': '+15105490570', 'display_phone': '(510) 549-0570', 'distance': 1335.0298875658677}], 'total': 805, 'region': {'center': {'longitude': -122.27508544921875, 'latitude': 37.868608844326545}}}
