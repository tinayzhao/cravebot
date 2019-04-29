from spellchecker import SpellChecker

spell = SpellChecker()

def check(*args):
    users_location = args[0]
    check_location = ""
    for c in args[0]:
        if c.isalnum():
            check_location += c.lower()
    #print(check_location)
    users_term = args[1]
    check_term = ""
    for c in args[1]:
        if c.isalnum():
            check_term += c.lower()

    bool_location = users_location != ""
    bool_term = users_term != ""
    print("USERS TERM " + users_term)
    lst = [];
    if (bool_location):
        lst.append(users_location)
    if (bool_term):
        lst.append(users_term)
    misspelled = spell.unknown(lst)

    suggestions = []
    for word in misspelled:
        check_word = ""
        special = False
        for c in word:
            if c.isalnum():
                check_word += c.lower()
            else:
                special = True
        if not bool_term:
            if special:
                if check_word != check_location:
                    suggestions.append(list(spell.candidates(word)))
            else:
                suggestions.append(list(spell.candidates(word)))
        else:
            if special:
                if check_word != check_term:
                    suggestions.append(list(spell.candidates(word)))
            else:
                suggestions.append(list(spell.candidates(word)))
    #print("=======")
    #print(check_word)
    #print(suggestions)
    return suggestions
#check()
