extends Node
@export var initital_state : state

var current_state : state
var states : Dictionary = {}
#below, is a one time func that tells the code to get all the childern under state machine, then see if they have a line known as "Extends state", and if so child as "state.child". EX:states["idle"] =idle. in short labes all the childern for the dictornary to understand.

func _ready():
	print("I am Alive!")
	for child in get_children():
		if child is state: #"Does this child inherit from my state script?"
			states[child.name.to_lower()] = child #to_lower just means make names like chase, idle and die be lowercase, makes code not buggy
			child.Transitioned.connect(on_child_transition) # allows connection from other scripts to machine, 
		if initital_state:
			initital_state.Enter()
			current_state = initital_state 

func _process(delta):
	if current_state: #asking "Do we have a current state?"
		current_state.Update(delta) #execute current state



func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)
#“Only listen to the state that is currently active.” All states request a change but this func only allows for the apprioate one



func on_child_transition(state, new_state_name): #"I received a signal. Tell me who sent it and where they want to go."
	if state != current_state:
		return
		
		var new_state = states.get(new_state_name.to_lower()) #finds state enemy wants to switch to newstatename will come from other scripts, do not worry!
		
		if !new_state:#here if a state was imitted to this character on accidit, stops states like "fly" from affecting things that can't
			return
			
		if current_state: #tells old state to go away, transition animations?
			current_state.Exit()
			
		new_state.Enter() #new state allowed to enter
		
		current_state = new_state 
