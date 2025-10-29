extends Node

@export var Mob_scene:PackedScene


func _on_mob_timer_timeout() -> void:
	var Mob= Mob_scene.instantiate()
	
	var Mob_Spawn_Location = get_node("SpawnPath/SpawnLocation")
	
	Mob_Spawn_Location.progress_ratio= randf()

	var Player_position= $Player.position
	Mob.initialize(Mob_Spawn_Location.position, Player_position )
	
	add_child(Mob)
	
