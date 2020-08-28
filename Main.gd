extends Node2D

onready var viewport = get_viewport_rect().size
onready var btn_play = $CenterContainer/Button
onready var quit = $CenterContainer/Button2
onready var credits = $CenterContainer/Button3
onready var player = $AudioStreamPlayer
onready var admob =  $Admob

func _ready():
	admob.load_banner()

func _on_btn_play_pressed():
	player.play()
	get_tree().change_scene("res://Wait.tscn")
	pass


func _on_btn_quit_pressed():
	player.play()
	get_tree().quit()
	pass


func _on_TextureButton3_pressed():
	player.play()
	get_tree().change_scene("res://Credits.tscn")
	pass



