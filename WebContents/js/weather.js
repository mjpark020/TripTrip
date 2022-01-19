function getWeatherParam(aCode, gCode){
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() +1)).slice(-2);
	var date = ('0' + today.getDate()).slice(-2);
	var base_date = ''+ year + month + date; 
	
	var hours = today.getHours();
	var base_time = 0;
	var fcstTime = ('0' + today.getHours() + '00').slice(-4);
	
	if(hours == 0 || hours == 1){
		today = new Date()-1;
		year = today.getFullYear();
		month = ('0' + (today.getMonth() +1)).slice(-2);
		date = ('0' + today.getDate()).slice(-2);
		base_date = '' + year + month + date;
	}
	else if(hours < 5){
		base_time = '0200';
	}
	else if(hours < 8){
		base_time = '0500';
	}
	else if(hours <11){
		base_time = '0800';
	}
	else if(hours < 14){
		base_time = '1100';
	}
	else if(hours < 17){
		base_time = '1400';
	}else{
		base_time = '1700';
	}
	
	return [base_date, base_time, fcstTime];
}
