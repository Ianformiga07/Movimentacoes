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
                    numGta = rsConsultaMovimentacao("NumGTA")
                    serie  = rsConsultaMovimentacao("SerieGTA")   
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
                </tbody>
              </table>
                <!-- Inicio Modal -->
                  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">GTA &nbsp&nbsp---&nbsp&nbsp UF - TO &nbsp&nbsp| Série - <%=serie%> &nbsp&nbsp| Numero - <%=numGta%></h4>
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
                            <label class="control-label"><%=(nomeFinal)%></label>
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

                        <div class="divDados">
                          <div class="form-group col-md">
                          <div class="tile-title">Estratificação</div>
                            <table width="120%">
                              <tr>
                                <th>Grupo</th>
                                <th>Espécie</th>
                                <th>Categoria</th>
                                <th>Faixa</th>
                                <th>Sexo</th>
                                <th>Quantidade</th>
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

                        <div class="divDados">
                          <div class="form-group col-md">
                            <div class="tile-title">Dados Adicionais</div>
                            <label class="control"><strong>Tipo Eminente:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(nomeFinal)%></label>
                            <br>
                            <label class="control"><strong>Data Emissão:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=NomeProp%></label>
                            <br>
                            <label class="control"><strong>Unidade Expedidora:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=NomeProp%></label>
                            <br>
                            <label class="control"><strong>Nr. CRMV:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=NomeProp%></label>
                          </div>

                          <div class="form-group col-md">
                            <div class="tile-title">&nbsp</div>
                            <label class="control"><strong>Validade:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(nomeFinal)%></label>
                            <br>
                            <label class="control"><strong>Emitente:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=NomeProp%></label>
                            <br>
                            <label class="control"><strong>Local:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=NomeProp%></label>
                            <br>
                            <label class="control"><strong>Telefone da Unidade:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=NomeProp%></label>
                          </div>
                        </div>
                        <div class="divDados">
                          <div class="form-group col-md">
                            <label class="control"><strong>Finalidade:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(nomeFinal)%></label>
                            <br>
                            <label class="control"><strong>Dados Motorista:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=NomeProp%></label>
                            <br>
                            <label class="control"><strong>Meio de Transporte:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=NomeProp%></label>
                          </div>
                          <div class="form-group col-md">
                            <label class="control"><strong>Dare N°:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(nomeFinal)%></label>
                            <br>
                            <label class="control"><strong>Veiculo:</strong>&nbsp&nbsp</label>
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