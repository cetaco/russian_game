extends Node

class_name Player

var max_life : int
var life : int

func _init(life := 3, name := "empty") -> void:
	max_life = life
	self.life = max_life
	self.name = name
	

func take_damage(damage := 1):
	life -= damage
	if life <= 0:
		die()

func die():
	print("morreu")
