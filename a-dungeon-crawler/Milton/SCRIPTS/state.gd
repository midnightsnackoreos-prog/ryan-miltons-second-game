extends Node
class_name state

signal Transitioned

#Explantations: runs once when the enemy enters this state, something like idle to chase
func Enter():
	pass
#Explanations: simple, exiting state to idle
func Exit():
	pass
#explanations:this func runs every frame during the game
func Update(_delta: float):
	pass
#used for collosion updates or something to that nature
func Physics_Update(_delta: float):
	pass
