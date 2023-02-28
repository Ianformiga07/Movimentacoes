<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="lib/Conexao.asp"-->
<!--#include file="base.asp"-->

  <body>
    <main class="app-content">
      <div class="app-title">
          <div>
            <h1><i class="fa fa-dashboard"></i> Sistema de Movimentações de GTA</h1>
          </div>
        </div>
        <div class="tile">
        <h3 class="tile-title">Buscar Produtor</h3>
        <form class="row">
          <div class="form-group col-md-3">
            <label class="control-label">CPF/CNPJ</label>
            <input class="form-control" type="text" name="buscaProdutorCpfCnpj" placeholder="000.000.000-00">
          </div>
          <div class="form-group col-md-3">
            <label class="control-label">Produtor</label>
            <input class="form-control" type="text" name="buscaProdutorProdutor" placeholder="João dos Santos Alves">
          </div>
          <div class="form-group col-md-3">
            <label class="control-label">Cidade</label>
              <%
              call abreConexao 
                sql = "SELECT * FROM TB_Municipios WHERE CodEstado = 17 order by NomeMunicipio;"
                set rs1 = conn.execute(sql)             
              %>
              <select name="buscaProdutorCidade" class="select2-single form-control">
                  <option value=""> ------- Selecionar Cidade ------- </option>
                  <%do while not rs1.eof%>
                  <option value="<%=rs1("CodMunicipio")%>" <%if clng(rs1("CodMunicipio")) = clng(idPerfil) then%>selected <% end if%>><%=rs1("NomeMunicipio")%></option>
                  <% rs1.movenext 
                      loop 
                    call fechaConexao
                  %>
              </select>
          </div>
          <div class="form-group col-md-3 align-self-end">
            <button class="btn btn-primary jq-buscaProdutor" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>Buscar Produtor</button>
          </div>
        </form>
      </div>

      <div class="row">
        <div class="col-md-12 alvo-buscaProdutor"></div>
      </div>
    </main>
  </body>

  <script src="js/buscaProdutor.js"></script>
