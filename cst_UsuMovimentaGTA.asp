<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="base.asp"-->
<!--#include file ="lib/Conexao.asp"-->

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
   '  response.write nomeFinal
call fechaConexao

'response.end
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
            <label class="control-label "><h6><%=Ucase(nomeFinal)%></h6></label>
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
serie = rsConsultaMovimentacao("SerieGTA")
%>
<div class="alvo-buscaMovimeta">
<!--#include file="ajax/tab_buscaMovimenta.asp"-->
</div>
<%call fechaConexao%>


<input type="hidden" name="cod" value="<%=cod%>">
<input type="hidden" name="codProp" value="<%=codProp%>">
<input type="hidden" name="codProp" value="<%=serie%>">
    </main>
    <script src="js/buscaMovimenta.js"></script>