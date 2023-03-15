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
%>