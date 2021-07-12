%% Problem 1
% DCG accepts strings u2v, u and v are strings over {0, 1} u is v in reverse.

s --> [2].
s --> uzero, s, uzero.
s --> uone, s, uone.
uzero --> [0].
uone  --> [1].

%% Problem 2
% three neighbouring houses problem, outputs strings
% [h(Col1,Nat1,Pet1), h(Col2,Nat2,Pet2), h(Col3,Nat3,Pet3)]
%
% String of 3 houses h(C,N,P), no two cols, nats, pets equal

nbd --> [H1,H2,H3], {h([C1,N1,P1],[]),h([C2,N2,P2],[]),h([C3,N3,P3],[]),
                     C1\=C2, C1\=C3, C2\=C3, N1\=N2, N1\=N3, N2\=N3, P1\=P2, P1\=P3, P2\=P3,
                     H1=h(C1,N1,P1), H2=h(C2,N2,P2), H3=h(C3,N3,P3)}.

%form of house
h --> col,nat,pet.

%strings of each type
col --> [red].
col --> [blue].
col --> [green].

nat --> [spanish].
nat --> [japanese].
nat --> [english].

pet --> [jaguar].
pet --> [snail].
pet --> [zebra].

%% Problem 3
%L3 are strings tat have third last digit =1, __100,__101,etc
accept(L) :- steps(q0,L,F), final(F).
steps(Q,[],Q).
steps(Q,[H|T],Q2) :- tran(Q,H,Qn), steps(Qn,T,Q2).

%Last element
final(q3).

%transitions wokring backwards
tran(q2,1,q3).
tran(q2,0,q3).
tran(q1,0,q2).
tran(q1,1,q2).
tran(q0,0,q0).
tran(q0,1,q0).

%this is the third last element
tran(q0,1,q1).

%transitions as DCG

q0 --> [0], q0. %tran(q0,0,q0).
q0 --> [1], q0. %tran(q0,1,q0).
q0 --> [1], q1. %tran(q0,1,q1).
q1 --> [0], q2. %tran(q1,0,q2).
q1 --> [1], q2. %tran(q1,1,q2).
q2 --> [0], q3. %tran(q2,0,q3).
q2 --> [1], q3. %tran(q2,1,q3).
q3 --> []. %final(q3)

numeral(0).
numeral(succ(X)) :- numeral(X).

%rules for last 3 elements
l3([1,0,0], succ(succ(succ(0)))).
l3([1,0,1], succ(succ(succ(0)))).
l3([1,1,0], succ(succ(succ(0)))).
l3([1,1,1], succ(succ(succ(0)))).

%recursively remove Head of list and Num is one less
l3([0|T], succ(Num)) :- l3(T, Num).
l3([1|T], succ(Num)) :- l3(T, Num).


