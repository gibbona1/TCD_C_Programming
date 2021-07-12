%Prolog term encoding
pterm(null).
%If X is a pterm, then so are f0(X) and f1(X)
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

%Some initial rules to define increment of pterms
incr(null,f1(null)).
%incr(f0(null),f1(null)).
%incr(f1(null),f0(f1(null))).
%incr(f0(f1(null)),f1(f1(null))).
% increment by changing end term from 1 to 0 and recursively
% incrementing inside
incr(f0(P1),f1(P1)).
%:- P1 \= f0(null).
incr(f1(P1),f0(P2)) :- incr(P1,P2).
%increment this way when the above rules don't cover the pterms
%incr(f0(f0(P)),f1(f0(P))) :- P \= null.
%incr(f0(f1(P)),f1(f1(P))) :- P \= null.

% know f0(null) is legal, then recursively increment to P
legal(f0(null)).
legal(P) :- legal(P1), incr(P1,P), P1 \= null.

%check X is legal first, then increment to Y
incrR(X,Y) :- legal(X), incr(X,Y).

%0+P=P and P+0=P
add(null,P,P).

%X+1 rule
add(f0(P1) ,f1(null),f1(P1)).
%adding inside as outside digit stays the same
add(f0(P1) ,f0(P2), f0(P3)) :- add(P1,P2,P3).
%recursicely add insides
add(f0(P1) ,f1(P2), f1(P3)) :- P2 \= null, add(P1,P2,P3).
%X+0=X rule
add(f1(P1),null,f1(P1)).
%recursicely add insides
add(f1(P1) ,f0(P2), f1(P3)) :- add(P1,P2,P3).
%add insides and increment answer
add(f1(P1) ,f1(P2), f0(P3)) :- add(P1,P2, Z), incr(Z,P3).


%0xP=0 and Px0=0 (from below clause)
mult(null,_,null).
%mult(_,null,null).
mult(_,f0(null),f0(null)).
%10AxB=10C iff AxB=C (works in base 2)
mult(f0(P1),P2,f0(P3)) :- P2 \= f0(null), mult(P1,P2,P3).
%AxB=C iff (A-1)xB + B = C
mult(f1(P1),P2,P3) :- P2 \= f0(null), mult(f0(P1),P2,Z), add(P2,Z,P3).

%make a 3 argument rev function which starts at null
revers(P,RevP) :- rev(P,null,RevP).
%end case, when we know we're done
rev(null,X,X).
%2 start clauses, put outer fi() of P around null
rev(f0(P),null,RevP) :- rev(P,f0(null),RevP).
rev(f1(P),null,RevP) :- rev(P,f1(null),RevP).
%recursive clause for X not covered above
rev(f0(P),X,RevP) :- X \= null, rev(P,f0(X),RevP).
rev(f1(P),X,RevP) :- X \= null, rev(P,f1(X),RevP).

%base rule for null
normalize(null, f0(null)).
normalize(P, Pn) :- P \= null, enc(P,Pn).
%rule for when we are done recursively getting inside P
enc(null,f0(null)).
%Z (and so Pn) is made legal by the below clauses
enc(f0(X),Z) :- enc(X,X1), mult(X1,f0(f1(null)),Z).
enc(f1(X),Z) :- enc(X,X1), mult(X1,f0(f1(null)),Z1), incr(Z1,Z).


% test add inputting numbers N1 and N2
testAdd(N1,N2,T1,T2,Sum,SumT) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
add(T1,T2,SumT), pterm2numb(SumT,Sum).
% test mult inputting numbers N1 and N2
testMult(N1,N2,T1,T2,N1N2,T1T2) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
mult(T1,T2,T1T2), pterm2numb(T1T2,N1N2).
% test revers inputting list L
testRev(L,Lr,T,Tr) :- ptermlist(T,L), revers(T,Tr), ptermlist(Tr,Lr).
% test normalize inputting list L
testNorm(L,T,Tn,Ln) :- ptermlist(T,L), normalize(T,Tn), ptermlist(Tn,Ln).
% make a pterm T from a number N numb2term(+N,?T)
numb2pterm(0,f0(null)).
numb2pterm(N,T) :- N>0, M is N-1, numb2pterm(M,Temp), incr(Temp,T).
% make a number N from a pterm T pterm2numb(+T,?N)
pterm2numb(null,0).
pterm2numb(f0(X),N) :- pterm2numb(X,M), N is 2*M.
pterm2numb(f1(X),N) :- pterm2numb(X,M), N is 2*M +1.
% reversible ptermlist(T,L)
ptermlist(null,[]).
ptermlist(f0(X),[0|L]) :- ptermlist(X,L).
ptermlist(f1(X),[1|L]) :- ptermlist(X,L).
