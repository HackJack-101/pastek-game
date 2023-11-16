extends CanvasLayer

var score: int


func updateScore(points):
	score += points
	$ScoreLabel.text = "Score: " + str(score)


func resetScore():
	score = 0
	$ScoreLabel.text = "Score: 0"


func updateFruit(fruit):
	$NextFruitLabel.text = "Next: " + fruit


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
