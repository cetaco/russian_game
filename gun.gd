extends Node
class_name Gun

enum bullet_state {EMPTY, BULLET, HEAL_BULLET, SUPER_BULLET}

var mag_size : int
var bullets : Array[bullet_state]

func _init(mag_size = 6) -> void:
	self.mag_size = mag_size
	empty_gun()
	put_bullets(6)
	
func empty_gun():
	for bullet in range(mag_size):
		bullets.append(bullet_state.EMPTY)
	
func put_bullets(bullet_amount := 1):
	for bullet in range(bullet_amount):
		bullets[bullet] = bullet_state.HEAL_BULLET

func shot(player : Player):
	var bullet = randi_range(0, mag_size-1)
	if bullets[bullet] == bullet_state.BULLET:
		bullets[bullet] = bullet_state.EMPTY
		player.take_damage(1)
		print("BANG")
	elif bullets[bullet] == bullet_state.HEAL_BULLET:
		bullets[bullet] = bullet_state.EMPTY
		player.take_damage(-1)
		print("HEAL BANG")
	else:
		print("clack")
	
	#print(player.name, ": ", player.life)
