extends Node

@export var Mob_scene:PackedScene


func _on_mob_timer_timeout() -> void:
	var Mob= Mob_scene.instantiate()
	
	var Mob_Spawn_Location = get_node("SpawnPath/SpawnLocation")
	
	Mob_Spawn_Location.progress_ratio= randf()

	var Player_position= $Player.position
	
	Mob.initialize(Mob_Spawn_Location.position, Player_position )
	
	add_child(Mob)
	
	Mob.squashed.connect($UserInterface/ScoreLabel._on_Mob_squashed.bind())
	


func _on_player_hit() -> void:
	$MobTimer.stop()
	$UserInterface/Retry.show()
	
	
func _ready() -> void:
	$UserInterface/Retry.hide()
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		
		get_tree().reload_current_scene()
