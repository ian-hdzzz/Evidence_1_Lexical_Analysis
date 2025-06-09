import unittest
from regex_automata import valid_word

# unitary test
class TestRegularExpression(unittest.TestCase):
    
    def test_valid_words(self):
        """Test that all valid words are accepted"""
        valid_words = ["mahdi", "maqbara", "matar", "maula", "midri"]
        for word in valid_words:
            with self.subTest(word=word):
                self.assertTrue(valid_word(word))
    
    def test_invalid_words(self):
        """Test that invalid words are rejected"""
        invalid_words = [
            # Partial words
            "mah", "maq", "mat", "mau", "mid",
            # Typos
            "mahd", "magbara", "mater", "maule", "mudri",
            # Additional characters
            "mahdia", "maqbaras", "mataru", "maulax", "midrix",
            # Prefixes
            "amahdi", "xmaqbara", "zmatar", "kmaula", "pmidri",
            # Empty string and completely different words
            "", "hello", "python", "prolog", "regex",
            # Mixed case
            "Mahdi", "MAQBARA", "MaTaR", "mAuLa", "mIdRi"
        ]
        for word in invalid_words:
            with self.subTest(word=word):
                self.assertFalse(valid_word(word))



# dynamic test
def main():
    print("Welcome to the Regular Expression Tester")
    print("This program checks if a word belongs to the language:")
    print("  {mahdi, maqbara, matar, maula, midri}")
    print("\nType 'exit' to quit the program")
    
    while True:
        word = input("\nEnter a word to test: ")
        
        if word.lower() == 'exit':
            print("Goodbye!")
            break
        
        if valid_word(word):
            print(f"'{word}' is ACCEPTED by the language")
        else:
            print(f"'{word}' is REJECTED by the language")

if __name__ == "__main__":
    main()