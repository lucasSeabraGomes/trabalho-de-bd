<?php 
$cpf = (isset($_GET["cpf"]) ? $_GET["cpf"] : NULL);
$con = mysqli_connect("127.0.0.1", "root", "", "mydb");
$db  = mysqli_select_db($con, 'mybd');
$sql ="
			SELECT pe.nome as nome_pessoa ,dc.nome as nome_doenca, pe.cpf
			FROM mydb.doencacronica dc
			JOIN mydb.escoteiro_has_doencacronica edc ON edc.doencaCronica_id = dc.id
			JOIN mydb.pessoa pe ON pe.cpf = edc.escoteiro_pessoa_cpf
			WHERE edc.escoteiro_pessoa_cpf = $cpf
	";
	$resultado = mysqli_query($con, $sql);
	$row 	   = mysqli_fetch_assoc($resultado);
?>
<html>
	<head>
		<title>Página de edição de dados</title>
		<meta charset = "utf-8"/>
	</head>
	<body>
		<form id = "form1" name = "form1" method = "post">	
			<label>Nome</label>
			<br>
			<input type = "text" name = "nome" size = "11" id = "nome" value = "<?php $row['nome_pessoa']?>">
			<br>
			<button onclick = "validar(<?php echo $cpf;?>);">Alterar</button>
		</form>
		<script type="text/javascript">
			function validar(cpf){
				if (form1.nome.value == "") {
					alert("Nome não pode ser nulo");
					return false;
				}
				else{
					enviar(cpf);
				}	
			}
			function enviar(cpf){
				confirmacao = 'Atenção! \n\n' + 'Deseja enviar?';
				if (window.confirm(confirmacao)){
					document.getElementById('form1').action = "Pagina_cadastro_escoteiro_control.php?acao=alterar_cadastro&cpf="+cpf;
					document.getElementById('form1').submit();					
				}	
			}
		</script>
	</body>
</html>