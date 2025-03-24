test_valid_words :-
    writeln('Testing valid words:'),
    test_word('mahdi'),
    test_word('maqbara'),
    test_word('matar'),
    test_word('maula'),
    test_word('midri').

% Test cases for some invalid words
test_invalid_words :-
    writeln('Testing invalid words:'),
    test_word('madi'),
    test_word('maqara'),
    test_word('mah'),
    test_word('madri'),
    test_word('midr'),
    test_word('mmahdi'),
    test_word('mahdia'),
    test_word('xyz').

% Test a single word
test_word(Word) :-
    (check_word(Word) ->
        format('~w: Accepted~n', [Word])
    ;
        format('~w: Rejected~n', [Word])
    ).

% Run all tests
run_tests :-
    writeln('Starting DFA tests...'),
    test_valid_words,
    test_invalid_words,
    writeln('All tests completed.').