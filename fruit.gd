extends RigidBody2D

signal hit(points)

var fruitName: String
var type = "fruit"

var fruits = [
	"cerise",
	"fraise",
	"raisin",
	"orange",
	"kaki",
	"pomme",
	"poire",
	"peche",
	"ananas",
	"melon",
	"pasteque"
]

# Suika utilise les nombres triangulaires : https://fr.wikipedia.org/wiki/Nombre_triangulaire
var score = [0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55]


func _on_body_entered(body: Node2D):
	if body.type == "fruit":
		if body.fruitName == fruitName:
			var nextFruit = fruits.find(fruitName) + 1
			if nextFruit == fruits.size():
				nextFruit = 0
			var nextPosition = self.position.lerp(body.position, 0.5)
			body.delete()
			hit.emit(score[nextFruit])
			set_position(nextPosition)
			setFruit(fruits[nextFruit])
			apply_impulse(Vector2(0, -50 * min(self.mass, 1)))


# Called when the node enters the scene tree for the first time.
func _ready():
	mass = 1
#	rotation = 10*PI/180
	gravity_scale = 1
	#constant_force = Vector2(0, 1)
	contact_monitor = true
	max_contacts_reported = 1000000
	can_sleep = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var newAngle = get_rotation_degrees() + delta * 180
	$CollisionShape2D.set_rotation_degrees(newAngle)


func delete():
	queue_free()


func setFruit(fruit):
	match fruit:
		"cerise":
			setCerise()
		"fraise":
			setFraise()
		"raisin":
			setRaisin()
		"orange":
			setOrange()
		"kaki":
			setKaki()
		"pomme":
			setPomme()
		"poire":
			setAnanas()
		"peche":
			setPeche()
		"ananas":
			setAnanas()
		"melon":
			setMelon()
		"pasteque":
			setPasteque()


func setCerise():
	fruitName = "cerise"
	var fruitScale = Vector2(0.05, 0.05)
	mass = 0.02
	$CeriseSprite.show()
	$CeriseSprite.scale = fruitScale
	$CollisionShape2D.scale = fruitScale


func setFraise():
	fruitName = "fraise"
	var fruitScale = Vector2(0.1, 0.1)
	mass = 0.04
	$FraiseSprite.show()
	$FraiseSprite.scale = fruitScale
	$CollisionShape2D.scale = fruitScale


func setRaisin():
	fruitName = "raisin"
	var fruitScale = Vector2(0.2, 0.2)
	mass = 0.08
	$RaisinSprite.show()
	$RaisinSprite.scale = fruitScale
	$CollisionShape2D.scale = fruitScale


func setOrange():
	fruitName = "orange"
	var fruitScale = Vector2(0.25, 0.25)
	mass = 0.16
	$OrangeSprite.show()
	$OrangeSprite.scale = fruitScale
	$CollisionShape2D.scale = fruitScale


func setKaki():
	fruitName = "kaki"
	var fruitScale = Vector2(0.3, 0.3)
	mass = 0.32
	$KakiSprite.show()
	$KakiSprite.scale = fruitScale
	$CollisionShape2D.scale = fruitScale


func setPomme():
	fruitName = "pomme"
	var fruitScale = Vector2(0.35, 0.35)
	mass = 0.64
	$PommeSprite.show()
	$PommeSprite.scale = fruitScale
	$CollisionShape2D.scale = fruitScale


func setPoire():
	fruitName = "poire"
	var fruitScale = Vector2(0.4, 0.4)
	mass = 1.28
	# Corriger le sprite
	$AnanasSprite.show()
	$AnanasSprite.scale = fruitScale
	$CollisionShape2D.scale = fruitScale


func setPeche():
	fruitName = "peche"
	var fruitScale = Vector2(0.45, 0.45)
	mass = 2.56
	$PecheSprite.show()
	$PecheSprite.scale = fruitScale
	$CollisionShape2D.scale = fruitScale


func setAnanas():
	fruitName = "ananas"
	var fruitScale = Vector2(0.5, 0.5)
	mass = 5.12
	$AnanasSprite.show()
	$AnanasSprite.scale = fruitScale
	$CollisionShape2D.scale = fruitScale


func setMelon():
	fruitName = "melon"
	var fruitScale = Vector2(0.55, 0.55)
	mass = 10.24
	$MelonSprite.show()
	$MelonSprite.scale = fruitScale
	$CollisionShape2D.scale = fruitScale


func setPasteque():
	fruitName = "pasteque"
	var fruitScale = Vector2(0.55, 0.55)
	mass = 20.48
	$PastequeSprite.show()
	$PastequeSprite.scale = fruitScale
	$CollisionShape2D.scale = fruitScale
