<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="../Lib/Conexao.asp"-->

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
cod     = request.form("cod")
codProp = request.form("codProp") 

'Conta as movimentacoes
call abreConexao
set rsContaMovimentacao = conn.execute("EXECUTE [SP_MGTA_ContaMovimentacao] @id = '"& cod &"', @idPropriedade = '"& codProp &"'")
    Linhas = CSng(rsContaMovimentacao(0))
call fechaConexao

Offset = ((Pagina * Limite) - Limite) + 1
Limite2 = Pagina * Limite

'Define o total de resultados por página
if(Linhas <= Limite2)then
    Total = Linhas
else
    Total = Limite2
end if  

call abreConexao
set rsConsultaMovimentacao = conn.execute("EXECUTE [SP_MGTA_ConsultaMovimentacao] @id = '"& cod &"', @idPropriedade = '"& codProp &"', @Limit = '"& CSng(Limite2) &"', @Offset = '"& CSng(Offset) &"'")
%>
<!--#include file="tab_buscaMovimenta.asp"-->
<%call fechaConexao%>