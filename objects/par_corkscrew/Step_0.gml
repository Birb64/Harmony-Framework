
var p = instance_nearest(x,y,obj_player);
if(player_collide_object()) {
	in_corkscrew = true;
	p.state = player_state_null;
	p.x = travel + bbox_left;
	var scale = abs(bbox_top-bbox_bottom)*0.25
	p.y = y+scale*dsin(travel)
	p.ground_speed += p.x_accel*(input_hold(INPUT.RIGHT)-input_hold(INPUT.LEFT))
	travel += p.ground_speed
	with(p) {
		if(animation_get_current_animation(animator) != ANIM.CORKSCREW)
		animation_play(animator,ANIM.CORKSCREW)
		
		animator.animation_frame = (other.travel/32)%animation_get_frame_count(animator,ANIM.CORKSCREW);
	}
	
	//p.animator.animation_speed = abs(p.ground_speed)/8;
}
else if(in_corkscrew){
	p.state = player_state_normal;
	in_corkscrew = false;
}