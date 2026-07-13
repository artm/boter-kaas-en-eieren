# Negeer deze regel voor nu
extends Node

# De mogelijke toestanden van een vakje.
# EMPTY betekent dat het vakje nog niet is ingevuld.
enum CellState {
	EMPTY,
	X,
	O,
}

# Geeft de toestand van een vakje terug.
# cell_index is het nummer van het vakje, van 1 tot en met 9.
func get_cell(cell_index: int) -> CellState:
	var cell: Button = get_child(cell_index - 1)
	match cell.text:
		"X":
			return CellState.X
		"O":
			return CellState.O
		_:
			return CellState.EMPTY


# Verandert de toestand van een vakje.
# Een bestaande waarde wordt zonder waarschuwing overschreven.
func set_cell(cell_index: int, state: CellState) -> void:
	var cell: Button = get_child(cell_index - 1)
	match state:
		CellState.EMPTY:
			cell.text = str(cell_index)
			_set_empty_style(cell)
		CellState.X:
			cell.text = "X"
			_set_filled_style(cell)
		CellState.O:
			cell.text = "O"
			_set_filled_style(cell)

################################################################################
# details
################################################################################

func _set_filled_style(cell: Button) -> void:
	cell.add_theme_color_override("font_color", Color.WHITE)
	cell.add_theme_color_override("font_hover_color", Color.WHITE)
	cell.add_theme_color_override("font_pressed_color", Color.WHITE)
	cell.add_theme_font_size_override("font_size", 32)
	cell.add_theme_constant_override("outline_size", 2)
	cell.add_theme_color_override("font_outline_color", Color.BLACK)

func _set_empty_style(cell: Button) -> void:
	cell.add_theme_color_override("font_color", Color.DARK_GRAY)
	cell.add_theme_color_override("font_hover_color", Color.DARK_GRAY)
	cell.add_theme_color_override("font_pressed_color", Color.DARK_GRAY)
	cell.add_theme_font_size_override("font_size", 20)
	cell.add_theme_constant_override("outline_size", 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("connect cell's pressed events to ")
	for cell in self.get_children():
		cell.pressed.connect(get_parent().on_cell_clicked.bind(cell.get_index()+1))
		_set_empty_style(cell)
