//[script, arg0, arg1..]

if (is_array(scripts)){
	var pagescript = scripts[page];
	
	if (pagescript != -1){
		script_execute(pagescript[0]);
	}

}