extends CanvasLayer


func _ready():
	if OS.get_name() != "Android":
		hide()
