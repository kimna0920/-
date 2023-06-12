function serch(){
	if(document.frm.car_number.value == ""){
		alert("차량번호가 입력되지 않았습니다.");
		frm.car_number.focus();
	}
	else{
		frm.submit();
	}
}

function insert(){
	if(document.frm2.car_number.value == ""){
		alert("차량번호가 입력되지 않았습니다.");
		frm.car_number.focus();
		return false;
	}
	else if(document.frm2.owner_name.value == ""){
		alert("소유자이름이 입력되지 않았습니다.");
		frm.car_number.focus();
		return false;
	}
	else if(document.frm2.location.value == ""){
		alert("주차위치가 선택되지 않았습니다.");
		frm.car_number.focus();
		return false;
	}
	else if(document.frm2.entrance_time.value == ""){
		alert("입차시간이 입력되지 않았습니다.");
		frm.car_number.focus();
		return false;
	}
	else{
		alert("입차되었습니다");
		frm.submit();
		return true;
	}
}