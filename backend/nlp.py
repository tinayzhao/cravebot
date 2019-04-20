import spacy

nlp = spacy.load("en_core_web_sm")

hunspell = spaCyHunSpell(nlp, 'mac')
nlp.add_pipe(hunspell)

doc = nlp('I can haz cheezeburger.')
haz = doc[2]
print(haz._.hunspell_spell)  # False
print(haz._.hunspell_suggest)  # ['ha', 'haze', 'hazy', 'has', 'hat', 'had', 'hag', 'ham', 'hap', 'hay', 'haw', 'ha z']
