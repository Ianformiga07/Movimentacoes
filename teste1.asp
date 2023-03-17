<%
nome = "Elimarcos Ferreira de Morais"

nomeSplit = split(nome, " ")

nomeFinal = ""
For i = 0 To UBound(nomeSplit)
	if(i = 0)then
		nomeFinal = nomeFinal & nomeSplit(0) & " "
	end if

	if(i <> 0)then
		if(Len(nomeSplit(i)) > 2)then
			nomeFinal = nomeFinal & Left(nomeSplit(i), 1) & "********* "
		end if
	end if

Next

    Response.Write nomeFinal
%><br>
------------------------------------------------------------
<br>
<%
cpf3 = "044263330173"

cpf3_Primeiro = Left(cpf3, 3)

cpf3_Final = cpf3_Primeiro & ".***.***-**"

Response.Write cpf3_Final
%>
<br>
-----------------------------------------------------------
<br>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>