extends CharacterBody2D

@export var move_speed : float = 80
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var inventory_menu : CanvasLayer = $inventory_menu

var input_direction : Vector2 = Vector2.ZERO

func _ready():
	animation_tree.active = true
	
func _process(delta):
	update_animation_parameters()

func _physics_process(delta):
	# Get input direction
	input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	# Update velocity
	velocity = input_direction * move_speed
	
	# Move and slide function uses velocity of character body to move character around
	move_and_slide()
	
	# Add menu state machine here
	if Input.is_action_just_pressed("inventory_button"):
		inventory_menu.visible = !inventory_menu.visible

func update_animation_parameters():
	if(velocity == Vector2.ZERO):
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
		
	if(Input.is_action_just_pressed("use")):
		animation_tree["parameters/conditions/swing"] = true
	else:
		animation_tree["parameters/conditions/swing"] = false
	
	if (input_direction != Vector2.ZERO):
		animation_tree["parameters/Idle/blend_position"] = input_direction
		animation_tree["parameters/Walk/blend_position"] = input_direction
		animation_tree["parameters/Swing/blend_position"] = input_direction
	
	
	
	
