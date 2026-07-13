# Negeer deze regel voor nu
extends Node

# board geeft je een spelbord voor Boter Kaas en Eieren.
# het bestaat niet standaard, maar ik heb het gemaakt zodat jij kan focusen op 
# de lesdoelen.
@onready var board = $Board 

# deze functie wordt aangeroepen wanneer een vakje van het speelbord wordt aangeklikt.
# Het nummer van het aangeklikte vakje ("index") wordt als invoer doorgegeven.
func on_cell_clicked(cell_index: int) -> void:
	# om te zien dat het werkt: print de ontvangen nummer
	print("Clicked cell: ", cell_index)
