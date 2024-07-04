extends Area2D

@export var speed = 50
var look_direction = "down"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x = 1
	if Input.is_action_pressed("move_left"):
		velocity.x = -1
	if Input.is_action_pressed("move_down"):
		velocity.y = 1
	if Input.is_action_pressed("move_up"):
		velocity.y = -1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
		if velocity.y < 0:
			$AnimatedSprite2D.animation = "walk_up"
			look_direction = "up"
		elif velocity.y > 0:
			$AnimatedSprite2D.animation = "walk_down"
			look_direction = "down"
		elif velocity.x > 0:
			$AnimatedSprite2D.animation = "walk_side"
			$AnimatedSprite2D.flip_h = false
			look_direction = "right"
		elif velocity.x < 0:
			$AnimatedSprite2D.animation = "walk_side"
			$AnimatedSprite2D.flip_h = true
			look_direction = "left"
	else:
		if look_direction == "up":
			$AnimatedSprite2D.animation = "idle_up"
		elif look_direction == "down":
			$AnimatedSprite2D.animation = "idle_down"
		elif look_direction == "right":
			$AnimatedSprite2D.animation = "idle_side"
			$AnimatedSprite2D.flip_h = true
		elif look_direction == "left":
			$AnimatedSprite2D.animation = "idle_side"
			$AnimatedSprite2D.flip_h = false
	
	#$AnimatedSprite2D.animation = "idle_front"
	$AnimatedSprite2D.play()
		
		
	position += velocity * delta
	
	
