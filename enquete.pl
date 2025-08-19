% Déclaration des types de crime
crime_type(assassinat).
crime_type(vol).
crime_type(escroquerie).

% Liste des suspects
suspect(john).
suspect(mary).
suspect(alice).
suspect(bruno).
suspect(sophie).

% Faits pour le vol
has_motive(john, vol).
was_near_crime_scene(john, vol).
has_fingerprint_on_weapon(john, vol).

% Faits pour l'assassinat
has_motive(mary, assassinat).
was_near_crime_scene(mary, assassinat).
has_fingerprint_on_weapon(mary, assassinat).

% Faits pour l'escroquerie
has_motive(alice, escroquerie).
has_bank_transaction(alice, escroquerie).
has_bank_transaction(bruno, escroquerie).
owns_fake_identity(sophie, escroquerie).

% Règles de culpabilité (corrigées et complétées)

% Règle pour le vol
is_guilty(Suspect, vol) :-
    has_motive(Suspect, vol),
    was_near_crime_scene(Suspect, vol),
    has_fingerprint_on_weapon(Suspect, vol).

% Règle pour l'assassinat
is_guilty(Suspect, assassinat) :-
    has_motive(Suspect, assassinat),
    was_near_crime_scene(Suspect, assassinat),
    (has_fingerprint_on_weapon(Suspect, assassinat)
    ; eyewitness_identification(Suspect, assassinat)).

% Règle pour l'escroquerie
is_guilty(Suspect, escroquerie) :-
    has_motive(Suspect, escroquerie),
    (has_bank_transaction(Suspect, escroquerie)
    ; owns_fake_identity(Suspect, escroquerie)).

% Point d'entrée principal
main :-
    read(crime(Suspect, CrimeType)), % Lecture de l'entrée
    (is_guilty(Suspect, CrimeType) 
        -> writeln('guilty') 
        ; writeln('not_guilty')),
    halt.

% Initialisation du programme
:- initialization(main, program).