extends Node2D
@export var mob_scene: PackedScene
var score


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_player_hit() -> void:
	pass # Replace with function body.
	
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$hud.show_game_over()
	$Music.stop()
	$DeathSound.play()
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$hud.update_score(score)
	$hud.show_message("Get Ready")
	get_tree().call_group("mobs", "queue_free")
	$Music.play()

func _on_mobtimer_timeout() -> void:
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.position

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 4

	# Add some randomness to the direction.
	direction += randf_range(-PI / 6, PI / 2)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(190.0, 250.0), 60.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)


func _on_scoretimer_timeout() -> void:
	score += 1
	$hud.update_score(score)


func _on_startimer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
