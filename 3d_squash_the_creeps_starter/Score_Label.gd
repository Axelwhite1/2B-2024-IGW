extends Label


var Score = 0

func _on_Mob_squashed():
	Score += 1
	text= "Puntuacion: %s" % Score 
	
