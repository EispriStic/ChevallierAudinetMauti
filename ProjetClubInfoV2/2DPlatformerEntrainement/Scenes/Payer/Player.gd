extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0

const SPEED = 230
const JUMPFORCE = -1250
const gravity = 65
func _physics_process(_delta):
	
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
		
	else:
		$Sprite.play("idle")
		
	if not is_on_floor():
		$Sprite.play("air")
	
	velocity.y += gravity

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.20)
	
	if coins == 3:
		get_tree().change_scene("res://Scenes/Level1/Level1.tscn")


func _on_FallZone_body_entered(body):
	get_tree().change_scene("res://Scenes/Level1/Level1.tscn")
	
func add_coins():
	coins += 1
	#print("pieces : ", coins)
	
