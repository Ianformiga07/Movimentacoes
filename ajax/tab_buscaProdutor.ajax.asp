<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Lib/Conexao.asp"-->
<%

'Resultados por página
Limite = CSng(15)

'Número da página atual
if(trim(request.form("pagina")) <> "")then
    Pagina = CSng(request.form("pagina"))
else
    Pagina = CSng(1)
end if

'Dados da pesquisa
CpfCnpj = trim(request.form("CpfCnpj"))
Produtor = trim(request.form("Produtor"))
Cidade = trim(request.form("Cidade"))
session("CPF_tal") = trim(request.form("CpfCnpj"))
'Conta os produtores
call abreConexao
set rsContaProdutor = conn.execute("EXECUTE [SP_MGTA_ContaProdutor] @CpfCnpj = '"& CpfCnpj &"', @NomeProdutor = '"& Produtor &"', @Cidade = '"& Cidade &"'")
    Linhas = CSng(rsContaProdutor(0))
call fechaConexao

Offset = ((Pagina * Limite) - Limite) + 1
Limite2 = Pagina * Limite

'Define o total de resultados por página
if(Linhas <= Limite2)then
    Total = Linhas
else
    Total = Limite2
end if  

'Seleciona os produtores
call abreConexao
set rsConsultaProdutor = conn.execute("EXECUTE [SP_MGTA_ConsultaProdutor] @CpfCnpj = '"& CpfCnpj &"', @NomeProdutor = '"& Produtor &"', @Cidade = '"& Cidade &"', @Limit = '"& CSng(Limite2) &"', @Offset = '"& CSng(Offset) &"'")
   
%>
    <div class="tile">
        <div class=""><b>Resultados:</b> <%= Total &" / "& Linhas%><br></div>
        <div class="tile-body alvo-buscaProdutor">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>CPF/CNPJ</th>
                            <th>Produtor</th>
                            <th>Propriedade</th>
                            <th>Municipio</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                 
                        Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
                        Response.CodePage = 65001
                        Response.CharSet = "UTF-8" 
                        if(Total > 0)then
                            while not rsConsultaProdutor.EOF

                        'Mascara para esconder o CPF'
                        cpf3 = rsConsultaProdutor("CNPJCPFProdutor")
                        cpf3_Primeiro = Left(cpf3, 3)
                        cpf3_Final = cpf3_Primeiro & " . *** . *** - **"

                        nome = rsConsultaProdutor("NomeProdutor")
                        nomeSplit = split(trim(nome), " ")

                        nomeParcial = ""
                        For i = 0 To UBound(nomeSplit)
                        if(nomeSplit(i) <> "")then
                            nomeParcial = nomeParcial & nomeSplit(i) & " "
                        end if
                        next

                        nomeSplit = split(trim(nomeParcial), " ")

                        isEspolio = false
                        if(LCase(nomeSplit(0)) = LCase("ESPOLIO") OR LCase(nomeSplit(0)) = LCase("ESPÓLIO"))then
                        isEspolio = true
                        end if

                        nomeFinal = ""
                        For i = 0 To UBound(nomeSplit)
                        if(i = 0)then
                            nomeFinal = nomeFinal & nomeSplit(i) & " "
                        end if

                        if(i <> 0)then
                            if(Len(nomeSplit(i)) > 2)then
                            if(isEspolio)then
                                if(i = 1)then
                                nomeFinal = nomeFinal & nomeSplit(i) & " "
                                end if

                                if(i <> 1)then
                                nomeFinal = nomeFinal & Left(nomeSplit(i), 1) & "********* "
                                end if
                            Else
                                nomeFinal = nomeFinal & Left(nomeSplit(i), 1) & "********* "
                            end if
                            end if
                        end if
                        Next
                          'response.write nomeFinal
                          'response.end                           

                        %>
                                <tr>
                                
                                    <td><%=(cpf3_Final)%></td>
                                    <td><%=(nomeFinal)%></td>
                                    <td><%=rsConsultaProdutor("NomeProp")%></td>
                                    <td><%=rsConsultaProdutor("NomeMunicipio")%></td>
                                    <td><a href="./cst_UsuMovimentaGTA.asp?id=<%=rsConsultaProdutor("id")%>&codProp=<%=rsConsultaProdutor("idPropriedade")%>"><i class="fa fa-eye fa-2x" ></i></td>
                                </tr>
                            <%  
                            rsConsultaProdutor.movenext
                            wend 
                        end if
                        %>
                    </tbody>
                </table>

                <%
                if (CSng(Linhas) > CSng(Limite))then	
                    %>
                        <!--#include file="../paginacao.asp"-->
                    <% 
                end if	
                %>
            </div>
        </div>
    </div>
<%
call fechaConexao	 	   
%>  