Como colocar o botão de close na posição correta no canto superior direito no código a seguir: 
                
                  <div class="modal fade" id="myModal-<%=rsConsultaMovimentacao("NumGTA")%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">GTA &nbsp&nbsp---&nbsp&nbsp UF - TO &nbsp&nbsp| Série - <%=serie%> &nbsp&nbsp| Numero - <%=rsConsultaMovimentacao("NumGTA")%></h4>
                      </div>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>                     
                      <div class="modal-body">
                        <form class="row">
                        <div class="divDados">
                          <div class="form-group col-md">
                            <div class="tile-title">Procedência</div>
                            <label class="control"><strong>CPF/CNPJ:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(cpf3_Final)%></label>
                            <br>
                            <label class="control"><strong>Nome:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=UCase(nomeFinal1)%></label>
                            <br>
                            <label class="control"><strong>Estabelecimento:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("PropriedadeOrigem"))%></label>
                            <br>
                            <label class="control"><strong>Código PGA:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("NumDocPro"))%></label>
                            <br>
                            <label class="control"><strong>Município-UF:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("NomeMunicipio"))%></label>
                          </div>

                          <div class="form-group col-md">
                            <div class="tile-title">Destino</div>
                            <label class="control"><strong>CPF/CNPJ:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(cpf3_DestFinal)%></label>
                            <br>
                            <label class="control"><strong>Nome:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(nomeFinal)%></label>
                            <br>
                            <label class="control"><strong>Estabelecimento:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("PropriedadeDestino"))%></label>
                            <br>
                            <label class="control"><strong>Código PGA:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("CodMunDest"))%></label>
                            <br>
                            <label class="control"><strong>Município-UF:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("MunicipioDestino"))%></label>
                          </div>
                        </div>
                        <%
                        if rsConsultamovimentacao("CodEspAnimal") = 7100 or rsConsultamovimentacao("CodEspAnimal") = 7140 or rsConsultamovimentacao("CodEspAnimal") = 7130 or rsConsultamovimentacao("CodEspAnimal") = 7170 or rsConsultamovimentacao("CodEspAnimal") = 7184 or rsConsultamovimentacao("CodEspAnimal") = 7197 then
                        %>
                        <div class="divDados">
                          <div class="form-group col-md">
                            <div class="tile-title">Vacinações</div>
                            <label class="control"><strong>Marek:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(rsConsultamovimentacao("VacinaMarek")) %></label>
                            <br>
                            <label class="control"><strong>New Castle:</strong>&nbsp&nbsp</label>
                            <label class="control-label">-</label>
                          </div>

                          <div class="form-group col-md">
                            <div class="tile-title">Atestados</div>
                            <label class="control"><strong>Ep. Contagios</strong>&nbsp&nbsp</label>
                            <label class="control-label ">-</label>
                            <br>
                            <label class="control"><strong>Negativo Para Equitoparasi:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("VerificaCodExame"))%></label>
                          </div>
                        </div>
                        <%end if%>              
                        <div class="divDados">
                          <div class="form-group col-md">
                            <div class="tile-title">Dados Adicionais</div>
                            <label class="control"><strong>Tipo Eminente:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(rsConsultamovimentacao("DescrTipoEmitente"))%></label>
                            <br>
                            <label class="control"><strong>Data Emissão:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("DataHoraEmissao"))%></label>
                            <br>
                            <label class="control"><strong>Unidade Expedidora:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("NomeUnidadeExpedidora"))%></label>
                          </div>
                          <div class="form-group col-md">
                            <div class="tile-title">&nbsp</div>
                            <label class="control"><strong>Validade:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(rsConsultamovimentacao("DataValidadeGTA"))%></label>
                            <br>
                            <label class="control"><strong>Emitente:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(nomeFinalEmi)%></label>
                            <br>
                            <label class="control"><strong>Local:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("NomeMunEmissao"))%></label>
                            <br>
                            <label class="control"><strong>Telefone da Unidade:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("TelefoneUnidadeExpedidora"))%></label>
                          </div>
                        </div>
                        <div class="divDados">
                          <div class="form-group col-md">
                            <label class="control"><strong>Finalidade:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(rsConsultamovimentacao("NomeFinalidade"))%></label>
                            <br>
                            <label class="control"><strong>Dados Motorista:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("NomeMotorista"))%></label>

                          </div>
                          <div class="form-group col-md">
                            <label class="control"><strong>Meio de Transporte:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("NomeTipoTransporte"))%></label>
                            <br>                            
                            <label class="control"><strong>Veiculo:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("Placa"))%></label>
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