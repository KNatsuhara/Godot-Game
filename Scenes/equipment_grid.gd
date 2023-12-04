extends GridContainer
@onready var equipment_slot = preload("res://Scenes/equipment_slot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var slot : Panel
	for i in range (10):
		for j in range(6):
			slot = equipment_slot.instantiate()
#			slot.position = Vector2(i * get_parent().size.x / 6.0, j * get_parent().size.x / 6.0)
#			slot.size = Vector2(get_parent().size.x / (6.0 + 1), get_parent().size.x / (6.0 + 1))
			add_child(slot)
	get_parent().custom_minimum_size.x = 370
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
