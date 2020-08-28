extends Node2D

onready var viewport = get_viewport_rect().size
var offset = Vector2(30, 12)
var offseth = Vector2(29, 12)
var offsetc = Vector2(45, 12)
var offsetagain = Vector2(51, 12)
onready var question = $Question
onready var numbers = $numbers
onready var  ans = $Answer
var numarr = [0]
onready var yes = $CenterContainer/VBoxContainer/btn_yes
onready var no = $CenterContainer/VBoxContainer/btn_no
onready var again = $CenterContainer2/VBoxContainer/btn_again
onready var home = $CenterContainer2/VBoxContainer/btn_home
onready var credits = $CenterContainer2/VBoxContainer/btn_credits
onready var player = $AudioStreamPlayer
var t = 0
var result = []
onready var admob =  $Admob


func questions():
	numarr.clear()
	if t != 7:
		for i in range(101):
			if bin(i).back() == 1:
				numarr.append(i)
		print(numarr)
		var text = ''
		for a in range(len(numarr)):
			text += str(numarr[a])+', '
		numbers.set_text(str(text))
		t += 1
	else: 
		giveresult()
	print(t)

func _ready():
	admob.load_banner()
	randomize()
	print(unbin([1, 1, 1]))
	yes.show()
	no.show()
	again.hide()
	home.hide()
	credits.hide()
	questions()
	pass 

func bin(num):
	var r = [0,0,0,0,0,0]
	var temp = []
	while num != 0:
		temp.append(num%2)
		num /= 2 
	temp.invert()
	for k in range(len(temp)):
		r.append(temp[k])
	if t !=  0 :
		for i in range(t):
			r.pop_back()
			r.pop_front()
	return r
	pass


func _on_btn_yes_pressed():
	player.play()
	result.append(1)
	questions()
	pass

func _on_btn_no_pressed():
	player.play()
	result.append(0)
	questions()
	pass


func giveresult():
	yes.hide()
	no.hide()
	again.show()
	home.show()
	credits.show()
	print(result)
	var fr = unbin(result)
	print(fr)
	if fr >  100:
		question.set_text('')
		numbers.set_text('')
		ans.set_text('Play Fair')
	else:
		question.set_text('Your Number is :')
		numbers.set_text('')
		ans.set_text(str(fr))
	
func unbin(val = []):
	var m = 0 
	for h in range(len(val)):
		if val[h] == 1:
			m += pow(2, h)
	return m


func _on_btn_play_again_pressed():
	player.play()
	t = 0
	numarr.clear()
	numarr.append(0)
	result.clear()
	again.hide()
	yes.show()
	no.show()
	home.hide()
	credits.hide()
	ans.set_text('')
	get_tree().change_scene("res://Wait.tscn")
	pass


func _on_btn_home_pressed():
	player.play()
	get_tree().change_scene("res://Main.tscn")


func _on_btn_credits_pressed():
	player.play()
	get_tree().change_scene("res://Credits.tscn")
