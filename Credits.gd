extends Node2D


onready var player = $AudioStreamPlayer
onready var admob = $Admob

func _ready():
	admob.load_banner()

func _on_home_btn_pressed():
	player.play()
	get_tree().change_scene("res://Main.tscn")
