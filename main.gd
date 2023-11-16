extends Node

var rng = RandomNumberGenerator.new()

@export var fruit_scene: PackedScene

var fruits = ["cerise", "fraise", "raisin", "orange", "kaki"]

var canPlay: bool = false
var currentFruit: String
var nextFruit: String
var nextNextFruit: String


func generateFruit():
	var randomFruit = rng.randi_range(0, fruits.size() - 1)
	return fruits[randomFruit]


func newGame():
	$Player.start($StartPosition.position)
	$HUD.resetScore()
	canPlay = true
	currentFruit = "fraise"
	nextFruit = generateFruit()
	nextNextFruit = generateFruit()
	$HUD.updateFruit(currentFruit)


# Called when the node enters the scene tree for the first time.
func _ready():
	newGame()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("space") && canPlay:
		_spawn_fruit()
		$ActionTimer.start()


func _spawn_fruit():
	var fruit = fruit_scene.instantiate()
	fruit.setFruit(currentFruit)
	fruit.position = $Player.position
	fruit.hit.connect(updateScore)
	add_child(fruit)
	canPlay = false
	currentFruit = nextFruit
	nextFruit = nextNextFruit
	nextNextFruit = generateFruit()
	$HUD.updateFruit(currentFruit)


func _on_action_timer_timeout():
	canPlay = true


func updateScore(points):
	$HUD.updateScore(points)


func _onFruitFusion(nextPosition, points, nextFruit):
	$HUD.updateScore(points)
	var fruit = fruit_scene.instantiate()
	fruit.setFruit(nextFruit)
	fruit.position = nextPosition
	add_child(fruit)
