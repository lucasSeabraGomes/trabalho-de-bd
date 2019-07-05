<?php
$con = mysqli_connect("127.0.0.1", "root", "", "mydb");
$db  = mysqli_select_db($con, 'mybd');

if (!empty($_POST['cpf_ajax'])) {

	$cpf = $_POST['cpf_ajax'];

	$sql="
			SELECT pe.nome as nome_pessoa ,dc.nome as nome_doenca
			FROM mydb.doencacronica dc
			JOIN mydb.escoteiro_has_doencacronica edc ON edc.doencaCronica_id = dc.id
			JOIN mydb.pessoa pe ON pe.cpf = edc.escoteiro_pessoa_cpf
			WHERE edc.escoteiro_pessoa_cpf = $cpf
	";
	$resultado = mysqli_query($con,$sql);

	$rowcount = mysqli_num_rows($resultado);

	if($rowcount > 0){
		echo "1";
	}
	else{
		echo "0";
	}
}
?>