extends VBoxContainer

@onready var material_slot = preload("res://Scenes/material_slot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var slot
	for i in range(20):
		slot = material_slot.instantiate()
		slot.get_child(1).text = "WUBBA" #set name here
		slot.get_child(2).text = ("x" + str(i)) #set value here		
		add_child(slot)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
