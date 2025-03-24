transition(q0, m, q1).
transition(q1, a, q2).
transition(q1, i, q10).
transition(q2, h, q3).
transition(q2, q, q5).
transition(q2, t, q7).
transition(q2, u, q9).
transition(q3, d, q4).
transition(q4, i, final1).
transition(q5, b, q6).
transition(q6, a, q12).
transition(q7, a, q8).
transition(q8, r, final3).
transition(q9, l, q11).
transition(q10, d, q13).
transition(q11, a, final4).
transition(q12, r, q14).
transition(q13, r, q15).
transition(q14, a, final2).
transition(q15, i, final5).

final_state(final1). % mahdi
final_state(final2). % maqbara
final_state(final3). % matar
final_state(final4). % maula
final_state(final5). % midri

% Accept a word by processing each symbol and checking if we end in a final state
accepts(Word) :-
    process(q0, Word).

% Base case: Empty word, check if we're in a final state
process(State, []) :-
    final_state(State).

% Recursive case: Process the first symbol, then the rest
process(CurrentState, [Symbol|Rest]) :-
    transition(CurrentState, Symbol, NextState),
    process(NextState, Rest).

% Helper predicate to convert a string to a list of atoms
string_to_atoms(String, Atoms) :-
    string_chars(String, Chars),
    maplist(atom_chars, Atoms, [Chars]).

% Main predicate to check if a string is accepted
check_word(Word) :-
    atom_chars(Word, Chars),
    accepts(Chars).