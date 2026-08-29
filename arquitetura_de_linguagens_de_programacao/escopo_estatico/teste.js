var x = 0;

function funcao_a_parte() {
	console.log(x);
}

function funcao_principal() {
	var x = 5;
	funcao_a_parte();
}

funcao_principal();
