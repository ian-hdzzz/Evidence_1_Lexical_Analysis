# Evidence 1 Implementation of Lexical Analysis
Ian Hernández Hernández - A01276755

## Description

I chose the 9th set of words that belongs to the Chakobasa language, which is a fictional language used by the Fremen of the Dune Universe created by Frank Herbert. In the series of novels beginning with Dune, it is explained that this language is based on another fictional language, Bhotani Jib.

We'll  be using just 5 words of these language to model and understand the lexical analysis designed to accurately detect a specific language.

1. mahdi - he who is rightly guided
2. maqbara - graveyard (a name for Rossak)
3. matar - a rain of sand from high altitudes
4. maula - slave
5. midri - winnowing fork

We'll be using two approches to the validation and analysis of the language: Finite Automaton and Regular expressions

## DFA
A Finite Automaton is the simplest way to recognize patterns, there are two types: Deterministic Finite Automaton (DFA) and Non-deterministic Finite Automaton (NFA). Since we are recognizing a finite set of specific words (mahdi, maqbara, matar, maula, midri) and not a more complex pattern language a DFA is the optimal solution both in terms of simplicity and efficiency.

![DFA](./DFA.png)

The DFA was constructed to represent a language consisting of exactly five specific words. The DFA comprises five key elements:

1. States (Q) = [q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, final1, final2, final3, final4, final5]
2. Alphabet (Σ) = [m, a, h, d, i, q, b, r, t, u, l]
3. Transition Function (δ) as shown in the state diagram, where each transition is defined for a specific state-symbol pair
4. Start State (q0) = q0
5. Accepting States (F) = [final1, final2, final3, final4, final5] corresponding to the words "mahdi", "maqbara", "matar", "maula", and "midri" respectively

The construction of the DFA began with the analysis of the allowed words and was designed so that each path in the automaton leads exactly to one of the accepted words, without ambiguities or redundant states.

## Prolog Implementation
The Prolog implementation of the DFA accepts strings composed only of the characters present in the five specified words and rejects any other combination.

## Code Explanation
* Transition rules define how the automaton moves between states based on the current input symbol.
* Final states represent the accepting states where the string is considered valid.
* Recursion in the process predicate is used to process each character of the input string and move through the DFA's states until the entire string is processed.

## Running the DFA in Prolog
To run the DFA in Prolog, follow these steps:

1. Open SWI-Prolog or another Prolog interpreter
2. Load the files using consult('dfa.pl') and consult('dfa_tests.pl')
3. To test the automaton, you can call the check_word predicate with a string:

> ?- check_word('mahdi').

4. The output will indicate all tests "All tests completed."
To run all tests:
> ?- run_tests.

## Regular Expression

The regular expression that defines our language, considering the specific words allowed, is:
^(mahdi|maqbara|matar|maula|midri)$

## Explanation of the Regular Expression

^: Ensures that the match starts at the beginning of the string
(mahdi|maqbara|matar|maula|midri): Allows exactly one of these five words
$: Ensures that the match ends at the end of the string

## Python Implementation
The Python implementation uses the re module to verify if a string belongs to the defined language.

Running the Regular Expression in Python

1. Run the file:
> python interactive_tester.py
2. Enter a string to test:
> Enter a word to test: mahdi
3. Enter a string to test:
> 'mahdi' is ACCEPTED by the language
4. Or for a non-accepted word:
Enter a word to test: hello
> 'hello' is REJECTED by the language

# Analysis
## Time Complexity
The time complexity is linear with respect to the input size, i.e., O(n), where n is the length of the input string. This is because each character in the input string is checked once, and transitions have constant time complexity.
Automaton Characteristics

# Conclusion
Both the DFA and Regular Expression implementations offer efficient ways to solve the problem of recognizing exactly the 5 specified words. The regular expression is simpler and more compact, while the DFA in Prolog provides a more visual and explicit representation of the recognition process.
For this specific case of a finite language with only 5 words, both implementations are equivalent in terms of functionality. The regular expression is the most concise solution, but the DFA provides a more instructive representation of the word recognition process.