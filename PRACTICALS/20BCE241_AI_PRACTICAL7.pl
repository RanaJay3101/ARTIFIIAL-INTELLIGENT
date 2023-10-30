/* Family Tree of Jay Rana  
 *     Program created on 13-10-2023     */

male(pravinbhai).
male(haresh).
male(jay).
male(dhruv).
male(shivam).
male(jimmy).
male(kiran).
male(raj).
male(bhumit).
male(ashok).
male(jenil).
male(harsh).
male(jignesh).
male(ajay).
male(dhansukh).
female(kusumben).
female(minaxi).
female(ramila).
female(jaya).
female(dhruvi).
female(shivani).
female(fenali).
female(aruna).
female(jaishree).
female(dharmistha).
female(nita).

parent(haresh,jay).
parent(haresh,dhruv).
parent(haresh,jaya).
parent(haresh,dhruvi).
parent(minaxi,jay).
parent(minaxi,dhruv).
parent(minaxi,jaya).
parent(minaxi,dhruvi).
parent(pravinbhai,haresh).
parent(pravinbhai,dharmistha).
parent(pravinbhai,nita).
parent(kusumben,haresh).
parent(kusumben,dharmistha).
parent(kusumben,nita).
parent(nita,shivam).
parent(nita,shivani).
parent(ajay,shivam).
parent(ajay,shivani).
parent(dharmistha,jenil).
parent(dharmistha,harsh).
parent(jignesh,jenil).
parent(jignesh,harsh).



mother(X,Y) :- parent(X,Y),female(X).
father(X,Y) :- parent(X,Y),male(X).

son(X,Y) :- parent(Y,X),male(X).
daughter(X,Y) :- parent(Y,X),female(X).

%brother(X,Y) :- father(Z,X), father(Z,Y),male(X), male(Y),X\==Y.
%brother(X,Y) :- father(Z,X), father(Z,Y),male(X), female(Y),X\==Y.
brother(X,Y) :- father(Z,X), father(Z,Y),male(X),X\==Y.
%sister(X,Y) :- father(Z,X), father(Z,Y),female(X), female(Y),X\==Y.
%sister(X,Y) :- father(Z,X), father(Z,Y),female(X), male(Y),X\==Y.
sister(X,Y) :- father(Z,X), father(Z,Y),female(X),X\==Y.

grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
grandmother(X,Z) :- mother(X,Y), parent(Y,Z).
grandfather(X,Z) :- father(X,Y), parent(Y,Z).

wife(X,Y) :- parent(X,Z),parent(Y,Z), female(X),male(Y).
husband(X,Y) :- parent(X,Z),parent(Y,Z), male(X),female(Y).

kaka(X,Z) :- brother(X,Y), parent(Y,Z),male(Y).
%kaka(X,Z) :- brother(X,Y),father(Y,Z).
mama(X,Z) :- brother(X,Y), parent(Y,Z),female(Y).
masi(X,Z) :- sister(X,Y), parent(Y,Z),female(Y).
foi(X,Z) :- sister(X,Y), parent(Y,Z),male(Y).

kaki(X,Z) :- wife(X,Y),kaka(Y,Z).
mami(X,Z) :- wife(X,Y),mama(Y,Z).
masa(X,Z) :- husband(X,Y),masi(Y,Z).
fua(X,Z) :- husband(X,Y),foi(Y,Z).

haschild(X):- father(X,_).
haschild(X):- mother(X,_).


