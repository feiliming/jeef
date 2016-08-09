function creatRandomNum() {
	var random_num = 0;
    for(var i=0;i<6;i++) 
    { 
        random_num+=Math.floor(Math.random()*100000); 
    } 
    return random_num;
}