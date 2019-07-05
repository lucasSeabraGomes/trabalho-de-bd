<?php
$acao 	   = (isset($_GET["acao"]) ? $_GET["acao"] : NULL);
$cpf  	   = (isset($_POST["cpf"]) ? $_POST["cpf"] : NULL);
$nome 	   = (isset($_POST["nome"]) ? $_POST["nome"] : NULL);
$data_nasc = (isset($_POST["data_nasc"]) ? $_POST["data_nasc"] : NULL);
$email 	   = (isset($_POST["email"]) ? $_POST["email"] : NULL);
$endereco  = (isset($_POST["endereco"]) ? $_POST["endereco"] : NULL);
$cep	   = (isset($_POST["cep"]) ? $_POST["cep"] : NULL);
$con   	   = mysqli_connect("127.0.0.1", "root", "", "mydb");

if(!$con){
	die('Erro na conexão');
}

switch($acao){
	case 'novo_cadastro':
		$sql = "INSERT INTO
		 		mydb.endereco (enderecoCompleto, cep)
		 		VALUES
		 		('$endereco', '$cep')";
		$resultado = mysqli_query($con, $sql);
		if(!isset($resultado)){
			echo "Erro no cadastro do endereço";
		}	
		$sql = "INSERT INTO 
				mydb.pessoa (cpf, nome, data_nasc, email, endereco_idendereco)
				VALUES
				('$cpf', '$nome', '$data_nasc', '$email', '$endereco')";
		$resultado = mysqli_query($con,$sql);		
		if(!isset($resultado)){
			echo "Erro no cadastro";
		}
		else{
			echo "<script>alert('Cadastrado com sucesso!');
						  window.location = 'Pagina_principal.php' </script>";
		}
	break;

	case 'alterar_cadastro':
		$sql = "UPDATE mydb.pessoa
				SET nome = '$nome'
				WHERE cpf = '$cpf'";
		$resultado = mysqli_query($con, $sql);	
		if(!isset($resultado)){
			echo "Erro na alteração";
		}
		else{
			echo "<script>alert('Alterado com sucesso!');
						  window.location = 'Pagina_principal.php' </script>";
		}		
	break;
}
?>