%astar(+Node,?Path,?Cost,+KB)
% Returns Path from Node to the goal node []
astar(Node,P,C,KB) :- search([[[Node], 0]],P1,C,KB), reverse(P1,P).

% from top of assignment
arc([H|T],Node,Cost,KB) :- member([H|B],KB), append(B,T,Node),length(B,L), Cost is 1+ L/(L+1).
heuristic(Node,H) :- length(Node,H).
goal([]).

% first _ is hidden var for More (of the frontier), second _ is hidden
% var for KB, CNode is cost up to node (want same as C), Path2N is path
% to node (want Path same as Path2N)
search([[[Node|Path2N], CNode]|_],Path2N,CNode,_) :- goal(Node).

search([[[Node|Path2N], CNode]|More],Path,C,KB) :-
    findall([TempNode,C1], %list template for Children, node cost pairs, to add to frontier
            arc(Node,TempNode,C1,KB), %new cost when adding the arc to node to path
            Children), % list of lists that satisfy the arc condition
    add2frontier(Children,[[[Node|Path2N], CNode]|More],New), %children from findall to "more" of frontier
    search(New,Path,C,KB). %Recursively search new frontier

add2frontier([], [[[_|_],_]|Rest], NewFrontier) :- !, minAtFront(Rest,NewFrontier).

add2frontier(Children, [[Path,OldC]|Rest], NewFrontier) :-
    sortCosts(Children, OldC, UpdChildren),
    sortPaths(UpdChildren, [Path,OldC], NewPaths),
    append(NewPaths, Rest, Unsorted), minAtFront(Unsorted,NewFrontier).

minAtFront([H|T], Result) :- sortf(H,[],T,Result).

%sort frontier by cost, lowest first
sortf(H,T,[],[H|T]).
sortf(Min, A, [H|T], Sorted) :- lessThan(Min, H), !, sortf(Min, [H|A], T, Sorted).
sortf(Min, A, [H|T], Sorted) :- lessThan(H, Min), !, sortf(H, [Min|A], T, Sorted).

sortCosts([[N1,C1]], OldCost, [[N1,C2]]) :- C2 is C1+OldCost.
sortCosts([[N1,C1]|T], OldCost, [[N1,C2]|TNew]) :- C2 is C1+OldCost, sortCosts(T,OldCost,TNew).

sortPaths([],_,[]).
sortPaths([[Child1,NewC1]|T],[OldPath,OldC],[[NewPath, NewC1]|NT]) :-
     append([Child1],OldPath,NewPath),
     sortPaths(T,[OldPath,OldC],NT).

% from assignment page
lessThan([[N1|_],C1],[[N2|_],C2]) :-
    heuristic(N1,Hvalue1), heuristic(N2,Hvalue2),
    F1 is C1+Hvalue1, F2 is C2+Hvalue2, F1 =< F2.

