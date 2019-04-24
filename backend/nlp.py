from spellchecker import SpellChecker

spell = SpellChecker()

def check(*args):
    users_location = args[0]
    users_term = args[1]

    bool_location = users_location != ""
    bool_term = users_term != ""

    lst = [];
    if (bool_location):
        lst.append(users_location)
    if (bool_term):
        lst.append(users_term)
    misspelled = spell.unknown(lst)

    suggestions = []
    for word in misspelled:
        suggestions.append(spell.candidates(word))
    return suggestions
