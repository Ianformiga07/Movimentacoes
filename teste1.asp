<!DOCTYPE html>
<html>
<head>
	<title>Exemplo de Modal com Tabela</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
		.modal {
		  display: none;
		  position: fixed;
		  z-index: 1;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  overflow: auto;
		  background-color: rgba(0, 0, 0, 0.5);
		}

		.modal-content {
		  background-color: #fefefe;
		  margin: 15% auto;
		  padding: 20px;
		  border: 1px solid #888;
		  width: 80%;
		  max-width: 600px;
		}

		.close {
		  color: #aaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}

		.close:hover,
		.close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}
	</style>
</head>
<body>
	<button id="btnAbrirModal">Abrir modal</button>
	<div id="myModal" class="modal">
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <h2>Título do modal</h2>
	    <table>
	      <tr>
	        <th>Coluna 1</th>
	        <th>Coluna 2</th>
	        <th>Coluna 3</th>
	      </tr>
	      <tr>
	        <td>Dado 1</td>
	        <td>Dado 2</td>
	        <td>Dado 3</td>
	      </tr>
	      <tr>
	        <td>Dado 4</td>
	        <td>Dado 5</td>
	        <td>Dado 6</td>
	      </tr>
	    </table>
	  </div>
	</div>

	<script>
		$(document).ready(function() {
		  $("#btnAbrirModal").click(function() {
		    $("#myModal").show();
		  });
		  $(".close").click(function() {
		    $("#myModal").hide();
		  });
		});
	</script>
</body>
</html>