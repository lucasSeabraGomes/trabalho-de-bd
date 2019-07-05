<!DOCTYPE html>
<html>
	<head>
		<title>Página de consulta de doenças</title>
		<meta charset="utf-8"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
	<body>
		<form name="form1" method="post">
			<label>CPF</label>
			<br>
				<input type = "text" name = "cpf" size = "11">
			<br>
			<button onclick = "getDoenca(document.form1.cpf.value);">Enviar</button>
		</form>		
		<script type="text/javascript">
			function getDoenca(cpf){
				$.ajax({
				type: "POST",
				url: "Pagina_consulta_doenca_control.php",				
				data: "cpf_ajax="+cpf, 
				
				success: function(data) {
					if(data == 1){
						 window.location = "resultado_consulta_doenca.php?cpf="+cpf;
					}
					else{
						alert("Esse CPF não possui doenças crônicas cadastradas");
					}
				}
				});
			}	
		</script>
	</body>
</html>