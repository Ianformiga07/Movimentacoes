<div class="clearfix"></div>
  <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class=""><b>Resultados:</b> <%= Total &" / "& Linhas%><br></div>
            <div class="table-responsive">
              <table class="table">
                <thead> 
                  <tr>
                    <th>GTA</th>
                    <th>Serie</th>
                    <th>Espécie</th>
                    <th>Produtor Destino</th>
                    <th>Propriedade Destino</th>
                    <th>Municipio Destino</th>
                    <th>UF Destino</th>
                    <th>Data</th>
                    <th>Total Animais</th>
                    <th>Ações</th>
                  </tr>
                </thead>
                <tbody>
                    <%                 
                    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
                    Response.CodePage = 65001
                    Response.CharSet = "UTF-8" 
                        
                    if(Total > 0)then
                        while not rsConsultaMovimentacao.EOF
                    nome = rsConsultaMovimentacao("ProdutorDestino")
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
                  
                    <td><%=rsConsultaMovimentacao("NumGTA")%></td>
                    <td><%=rsConsultaMovimentacao("SerieGTA")%></td>
                    <td><%=rsConsultaMovimentacao("Especie")%></td>
                    <td><%=(nomeFinal)%></td>
                    <td><%=rsConsultaMovimentacao("PropriedadeDestino")%></td>
                    <td><%=rsConsultaMovimentacao("MunicipioDestino")%></td>
                    <td><%=rsConsultaMovimentacao("EstadoDestino")%></td>
                    <td><%=rsConsultaMovimentacao("DataHoraEmissao")%></td>
                    <td><%=rsConsultaMovimentacao("TotalAnimais")%></td>
                    <td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="fa fa-eye fa-2x" ></button></i></td>
                  </tr>
                    <%
                      rsConsultaMovimentacao.movenext
                      wend 
                    end if
                    
                    %>          

                <!-- Inicio Modal -->
                <div class="modal fade modal-xl" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title text-center" id="myModalLabel">GTA &nbsp&nbsp---&nbsp&nbsp UF - TO &nbsp&nbsp| Série - F &nbsp&nbsp| Numero - 049447</h4>
                      </div>
                      <div class="modal-body">
                        <form class="row">
                        <div class="divDados">
                          <div class="form-group col-md">
                            <div class="tile-title">Procedência</div>
                            <label class="control"><strong>CPF/CNPJ:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(nomeFinal)%></label>
                            <br>
                            <label class="control"><strong>Nome:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=NomeProp%></label>
                            <br>
                            <label class="control"><strong>Estabelecimento:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(NomeMun)%></label>
                            <br>
                            <label class="control"><strong>Código PGA:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(NomeMun)%></label>
                            <br>
                            <label class="control"><strong>Município-UF:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(NomeMun)%></label>
                          </div>

                          <div class="form-group col-md">
                            <div class="tile-title">Destino</div>
                            <label class="control"><strong>CPF/CNPJ:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(nomeFinal)%></label>
                            <br>
                            <label class="control"><strong>Nome:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=NomeProp%></label>
                            <br>
                            <label class="control"><strong>Estabelecimento:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(NomeMun)%></label>
                            <br>
                            <label class="control"><strong>Código PGA:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(NomeMun)%></label>
                            <br>
                            <label class="control"><strong>Município-UF:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(NomeMun)%></label>
                          </div>
                        </div>

                        <div class="divDados">
                          <div class="form-group col-md">
                            <div class="tile-title">Vacinações</div>
                            <label class="control"><strong>Febre Aftosa:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(nomeFinal)%></label>
                            <br>
                            <label class="control"><strong>Brucelose:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=NomeProp%></label>
                          </div>

                          <div class="form-group col-md">
                            <div class="tile-title">Atestados</div>
                            <label class="control"><strong>Brucelose:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(nomeFinal)%></label>
                            <br>
                            <label class="control"><strong>Tuberculose:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=NomeProp%></label>
                          </div>
                        </div>
                        </form>                        
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Fim Modal -->                             
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
      </div>
    </div>