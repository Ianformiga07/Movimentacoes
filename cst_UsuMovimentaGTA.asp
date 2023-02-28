<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="lib/Conexao.asp"-->
<!--#include file="base.asp"-->
<%
cod     = Request.QueryString("id")
codProp = Request.QueryString("codProp") 
call abreConexao
sql = "SELECT * FROM TB_Produtor INNER JOIN TB_Propriedade ON TB_Produtor.CNPJCPFProdutor = TB_Propriedade.CNPJCPFProprietario inner join TB_Municipios on TB_Municipios.CodMunicipio = TB_Produtor.CodMunProdutor WHERE id = '"&cod&"' and idPropriedade = '"&codProp&"'"
   set rs = conn.execute(sql)

   if not rs.eof then
    Nome                =  rs("NomeProdutor")
    NomeProp            =  rs("NomeProp")
    NomeMun             =  rs("NomeMunicipio")
  end if
call fechaConexao
%>

    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i>Movimentações de GTA</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><a href="cst_buscaProdutor.asp"><i class="fa fa-home fa-lg"></i></a></li>
        </ul>
      </div>
<div class="tile">
        <h3 class="tile-title breadcrumb ">Dados Produtor</h3>
        <form class="row">
          <div class="form-group col-md">
            <label class="control"><h5>Produtor(a): </h5></label>
            <label class="control-label "><h6><%=Nome%></h6></label>
          </div>
          <div class="form-group col-md">
            <label class="control"><h5>Propriedade: </h5></label>
            <label class="control-label"><h6><%=NomeProp%></h6></label>
          </div>
          <div class="form-group col-md">
            <label class="control"><h5>Municipio: </h5></label>
            <label class="control-label"><h6><%=Ucase(NomeMun)%></h6></label>
          </div>
        </form>
      </div>
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
cod     = Request.QueryString("id")
codProp = Request.QueryString("codProp") 

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
<div class="alvo-buscaMovimeta">
<!--#include file="ajax/tab_buscaMovimenta.asp"-->
</div>
<%call fechaConexao%>
<input type="hidden" name="cod" value="<%=cod%>">
<input type="hidden" name="codProp" value="<%=codProp%>">
    </main>
    <script src="js/buscaMovimenta.js"></script>