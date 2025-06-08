initial(q0).

% Estados finales 

transition(q0, m, q1).
transition(q1, a, q2).
transition(q1, i, q10).
transition(q2, h, q3).
transition(q2, q, q5).
transition(q2, t, q7).
transition(q2, u, q9).
transition(q3, d, q4).
transition(q4, i, final).
transition(q5, b, q6).
transition(q6, a, q12).
transition(q7, a, q8).
transition(q8, r, final).
transition(q9, l, q11).
transition(q10, d, q13).
transition(q11, a, final).
transition(q12, r, q14).
transition(q13, r, q15).
transition(q14, a, final).
transition(q15, i, final).

final_state(final). % mahdi


% Accept a word by processing each symbol and checking if we end in a final state
accept(Word) :-
    atom_chars(Word, Characters), 
    initial(InitialState), 
    accept_aux(Characters, InitialState).

% Base case:
accept_aux([], State) :- 
    final_state(State).

% Recursive call:
accept_aux([Head|Tail], CurrentState) :- 
    trans(CurrentState, Head, NextState), 
    accept_aux(Tail, NextState).