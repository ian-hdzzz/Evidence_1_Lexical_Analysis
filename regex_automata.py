import re

def valid_word(word):
    # Define
    pattern = r'^(mahdi|maqbara|matar|maula|midri)$'
    
    # Check if the word matches the pattern
    match = re.match(pattern, word)
    
    return match is not None