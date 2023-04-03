<form>
  <fieldset>
    <legend>Escolha uma opção:</legend>
    <label>
      <input type="radio" name="opcao" value="opcao1" id="opcao1">
      Opção 1
    </label>
    <label>
      <input type="radio" name="opcao" value="opcao2" id="opcao2">
      Opção 2
    </label>
    <br>
    <br>
    <label>
      <input type="checkbox" name="checkbox1" value="checkbox1" id="checkbox1">
      Checkbox 1
    </label>
    <label>
      <input type="checkbox" name="checkbox2" value="checkbox2" id="checkbox2">
      Checkbox 2
    </label>
    <label>
      <input type="checkbox" name="checkbox3" value="checkbox3" id="checkbox3">
      Checkbox 3
    </label>
  </fieldset>
  <br>
  <input type="submit" value="Enviar" onclick="return validar()">
</form>
<script>
function validar() {
  var opcao1 = document.getElementById("opcao1");
  var opcao2 = document.getElementById("opcao2");
  var checkbox1 = document.getElementById("checkbox1");
  var checkbox2 = document.getElementById("checkbox2");
  var checkbox3 = document.getElementById("checkbox3");

  if (opcao1.checked && !(checkbox1.checked && checkbox2.checked || checkbox1.checked && checkbox3.checked || checkbox2.checked && checkbox3.checked)) {
    alert("Selecione pelo menos dois checkboxes.");
    return false;
  }
  
  if (opcao2.checked && !(checkbox1.checked || checkbox2.checked || checkbox3.checked)) {
    alert("Selecione pelo menos um checkbox.");
    return false;
  }
  
  return true;
}
</script>