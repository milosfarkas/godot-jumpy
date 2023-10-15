extends Node

var player_hp = 10
var gold = 0

func incGold(amount: int):
	Game.gold += amount
	if Game.gold >= 20:
		Game.gold -= 20
		Game.player_hp += 1
