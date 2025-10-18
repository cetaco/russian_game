extends Node

var swaping_gun : bool

var player_1: Player
var player_2: Player
var gun: Gun

var player_on_turn: Player

func _ready() -> void:
	swaping_gun = true
	player_1 = Player.new(3, "player_1")
	player_2 = Player.new(3, "player_2")
	
	gun = Gun.new()
	
	if randi_range(1, 2) == 1:
		player_on_turn = player_1
	else:
		player_on_turn = player_2

func _process(delta: float) -> void:
	
	if swaping_gun:
		if player_on_turn == player_1:
			player_on_turn = player_2
		else:
			player_on_turn = player_1
		print("========================")
		print("the gun is on ", player_on_turn.name, " hand")
		print("press SPACE to shot or BACKSPACE to self shot")
		print(player_1.name, ": ", player_1.life)
		print(player_2.name, ": ", player_2.life)
		print("========================")
		swaping_gun = false
		
	if Input.is_action_just_pressed("ui_accept"):
		shot_on_enemy()
	if Input.is_action_just_pressed("ui_text_backspace"):
		shot_self()

func shot_on_enemy():
	if player_on_turn == player_1:
		gun.shot(player_2)
	
	if player_on_turn == player_2:
		gun.shot(player_1)
	
	swaping_gun = true

func shot_self():
	gun.shot(player_on_turn)
	swaping_gun = true
