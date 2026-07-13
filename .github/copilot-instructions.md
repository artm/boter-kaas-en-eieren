# Doel van het project

Dit project is geen gewone game, maar een reeks programmeerlessen in Godot. De game dient uitsluitend als didactisch hulpmiddel. Elke les introduceert een klein aantal nieuwe concepten. De nadruk ligt op programmeren én systeemdenken.

De eerste lessen gebruiken boter-kaas-en-eieren als basis.

# Didactische uitgangspunten

* Introduceer slechts enkele nieuwe concepten per les.
* Houd de Godot-complexiteit zoveel mogelijk verborgen.
* De leerling schrijft alleen de spelregels; infrastructuur wordt vooraf geleverd.
* Elke les bouwt voort op de vorige.
* De leerling ontvangt voorlopig elke les als los archief. Git wordt pas in een latere les geïntroduceerd.
* Nieuwe informaticatermen worden bij het eerste gebruik cursief geschreven en daarna kort gedefinieerd.

# Les 1

Onderwerp:

Input, State, Output en de systeemgrens.

De theorie introduceert eerst systeemdenken in algemene zin en daarna de begrippen:

* systeem
* grens
* input
* state
* output

Pas daarna wordt de koppeling met de game gemaakt.

# Gewenste beginsituatie

Bij het openen van de les ziet de leerling een werkende maar "domme" speelbord.

De leerling kan op vakjes klikken.

Het klikmechanisme werkt volledig.

Er is nog geen spelgedrag.

Het leerlingscript bevat alleen een lege callback.

# Scene-structuur

Er is bewust slechts één scene.

```
Game
└── Board
    ├── Cell1
    ├── Cell2
    ├── Cell3
    ├── Cell4
    ├── Cell5
    ├── Cell6
    ├── Cell7
    ├── Cell8
    └── Cell9
```

Game is de root.

Board is een GridContainer.

Board heeft 3 kolommen.

Elke cel is een Button.

# Verdeling van verantwoordelijkheden

Board verzorgt:

* de visuele weergave
* de buttons
* het vertalen van button-clicks naar een celnummer
* de Board API

Game bevat uitsluitend de spelregels.

# Board API

Board biedt een eenvoudige API.

```
enum CellState
    EMPTY
    X
    O

get_cell(cell)

set_cell(cell, state)
```

De API is bewust "dom".

set_cell() mag een bestaande waarde zonder waarschuwing overschrijven.

Het controleren van spelregels gebeurt uitsluitend in Game.

Lege cellen tonen hun index.

X en O worden als tekst weergegeven.

# Callback

Board roept aan:

```
on_cell_clicked(cell)
```

waarbij cell een nummer is.

De leerling hoeft niets van signals of buttons te weten.

# Leerlingscript aan het begin van de les

De leerling ziet ongeveer:

```gdscript
extends Control

func on_cell_clicked(cell):
    pass
```

Er zijn nog geen variabelen.

Nog geen current player.

Nog geen spelregels.

# Oefeningen

1.

Plaats altijd een X.

Concept:

* functie aanroepen

2.

Voeg een variabele toe die onthoudt wie aan de beurt is.

Concept:

* state

3.

Wissel tussen X en O.

Concept:

* variabelen aanpassen

4.

Controleer of een vak leeg is.

Concept:

* if
* vergelijking

Later volgen:

* functies
* arrays
* lussen
* winstcontrole
* reset

# Belangrijke ontwerpkeuze

De leerling moet leren dat de Board een component is met een interface.

De leerling gebruikt uitsluitend:

* get_cell()
* set_cell()

De interne implementatie van Board is verborgen.

# Huidige situatie van de repository

De huidige implementatie is verder ontwikkeld dan gewenst voor les 1.

Breng de repository terug naar de beginsituatie van de les.

Verwijder alle spelregels uit het leerlingscript.

Behoud uitsluitend de infrastructuur die nodig is om:

* klikken te ontvangen
* een celnummer door te geven
* later get_cell() en set_cell() te gebruiken

Alles wat niet nodig is voor les 1 moet worden verwijderd of verborgen.

De leerling moet zich uitsluitend bezighouden met de concepten Input, State en Output en niet met Godot-infrastructuur.
