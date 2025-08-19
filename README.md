# Projet IA - Enquête Policière en Prolog

## Description
Programme Prolog résolvant des enquêtes criminelles avec différents types de crimes :
- Assassinat
- Vol
- Escroquerie

## Utilisation
```prolog
% Charger le programme
?- [enquete].

% Tester un suspect
?- crime(mary, assassinat).
guilty

% Lister tous les coupables pour un crime
?- findall(S, is_guilty(S, escroquerie), Coupables).
