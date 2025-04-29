extends Button

##################################################
var tween_modulate: Tween
var tween_scale: Tween

var normal_scale = Vector2(1, 1)
var hover_scale = Vector2(1.05, 1.05)
var normal_modulate = Color(1.0, 1.0, 1.0)
var hover_modulate = Color(1.25, 1.25, 1.25)


##################################################
func _ready() -> void:
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))
	
	pivot_offset = size * 0.5

##################################################
func _on_mouse_entered() -> void:
	if tween_modulate:
		tween_modulate.kill()
	if tween_scale:
		tween_scale.kill()
	
	tween_modulate = create_tween()
	tween_scale = create_tween()
	
	tween_modulate.tween_property(self, "modulate", hover_modulate, 0.5).\
		set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)
	tween_scale.tween_property(self, "scale", hover_scale, 0.5).\
		set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)

##################################################
func _on_mouse_exited() -> void:
	if tween_modulate:
		tween_modulate.kill()
	if tween_scale:
		tween_scale.kill()
	
	tween_modulate = create_tween()
	tween_scale = create_tween()
	
	tween_modulate.tween_property(self, "modulate", normal_modulate, 0.25).\
		set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)
	tween_scale.tween_property(self, "scale", normal_scale, 0.25).\
		set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)
