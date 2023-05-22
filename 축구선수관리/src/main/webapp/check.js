/**player_id char(7) NOT NULL,
	player_name varchar2(15),
	player_position char(2),
	player_date varchar2(8),
	team_id char(3), */
function modify(){
	if(frm.player_name.value == ""){
		frm.player_name.focus();
		return false;
	}
	else if(frm.player_position.value == ""){
		frm.player_position.focus();
		return false;
	}
	else if(frm.player_date.value == ""){
		frm.player_date.focus();
		return false;
	}
	else if(frm.team_id.value == ""){
		frm.team_id.focus();
		return false;
	}
	else {
		alert("정보를 입력합니다.");
		frm.submit();
		return true;
	}
}