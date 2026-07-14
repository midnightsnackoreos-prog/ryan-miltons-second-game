extends Node
var current_state : state
var states : Dictionary = {}

#below, is a one time func that tells the code to get all the childern under state machine, then see if they have a line known as "Extends state", and if so child as "state.child". EX:states["idle"] =idle. in short labes all the childern for the dictornary to understand.

func _ready():
	for child in get_children():
		if child is state:
			states[child.name] = child



func _process(delta):
	if current_state: #asking "Do we have a current state?"
		current_state.Update(delta) #execute current state


func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)
	
