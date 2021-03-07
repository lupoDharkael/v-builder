# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends AcceptDialog


func _ready():
	var donate_button = $VBoxContainer/TabContainer/Donate/Button
	donate_button.connect("pressed", self, "open_donation_url")
	$VBoxContainer/Label.text = ProjectSettings.get_setting("application/config/name") + "\nCopyright (c) 2021-2021 Lupo Dharkael"


func open_donation_url() -> void:
	OS.shell_open("https://www.paypal.com/paypalme/lupoDharkael")
