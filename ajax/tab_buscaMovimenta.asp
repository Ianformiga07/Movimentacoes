
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
                    NomeProdutor = rsConsultaMovimentacao("NomeProdutor")
                    numGta = rsConsultaMovimentacao("NumGTA")
                    serie  = rsConsultaMovimentacao("SerieGTA")   
                    nomeProdDestino = rsConsultaMovimentacao("ProdutorDestino")
                    codEsp = rsConsultaMovimentacao("CodEspAnimal")
                    nomeEmitente = rsConsultamovimentacao("NomeEmitente")
                    NomeMotorista = rsConsultamovimentacao("NomeMotorista")
'---------------- CPF Produtor Origem --------------------
                      cpf3 = rsConsultaMovimentacao("CNPJCPFProdutor")
                      cpf3_Primeiro = Left(cpf3, 3)
                      cpf3_Final = cpf3_Primeiro & " . *** . *** - **"               
                      'response.write cpf3
'---------------- CPF Produtor Destino --------------------
                      cpfDest = rsConsultaMovimentacao("CNPJCPFDest")
                      cpfDest_Primeiro = Left(cpfDest, 3)
                      cpf3_DestFinal = cpfDest_Primeiro & " . *** . *** - **"    
'---------------- Nome Produtor Origem --------------------
                    nomeSplit = split(trim(NomeProdutor), " ")

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

                    nomeFinal1 = ""
                    For i = 0 To UBound(nomeSplit)
                      if(i = 0)then
                        nomeFinal1 = nomeFinal1 & nomeSplit(i) & " "
                      end if

                      if(i <> 0)then
                        if(Len(nomeSplit(i)) > 2)then
                          if(isEspolio)then
                            if(i = 1)then
                              nomeFinal1 = nomeFinal1 & nomeSplit(i) & " "
                            end if

                            if(i <> 1)then
                              nomeFinal1 = nomeFinal1 & Left(nomeSplit(i), 1) & "* "
                            end if
                          Else
                            nomeFinal1 = nomeFinal1 & Left(nomeSplit(i), 1) & "* "
                          end if
                        end if
                      end if
                    Next


'---------------- Nome Produtor Destino -------------------
                    nomeSplit = split(trim(nomeProdDestino), " ")

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
                              nomeFinal = nomeFinal & Left(nomeSplit(i), 1) & "* "
                            end if
                          Else
                            nomeFinal = nomeFinal & Left(nomeSplit(i), 1) & "* "
                          end if
                        end if
                      end if
                    Next
                        'response.write nomeFinal
                        'response.end
                    %>
<%
'---------------- Nome Motorista -------------------
if NomeMotorista <> "" then
                    nomeSplit = split(trim(NomeMotorista), " ")

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

                    nomeFinalMoto = ""
                    For i = 0 To UBound(nomeSplit)
                      if(i = 0)then
                        nomeFinalMoto = nomeFinalMoto & nomeSplit(i) & " "
                      end if

                      if(i <> 0)then
                        if(Len(nomeSplit(i)) > 2)then
                          if(isEspolio)then
                            if(i = 1)then
                              nomeFinalMoto = nomeFinalMoto & nomeSplit(i) & " "
                            end if

                            if(i <> 1)then
                              nomeFinalMoto = nomeFinalMoto & Left(nomeSplit(i), 1) & "* "
                            end if
                          Else
                            nomeFinalMoto = nomeFinalMoto & Left(nomeSplit(i), 1) & "* "
                          end if
                        end if
                      end if
                    Next
                        'response.write nomeFinal
                        'response.end
end if                        
                    %>
<%
'---------------- Nome Emitente -------------------
                    nomeSplit = split(trim(nomeEmitente), " ")

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

                    nomeFinalEmi = ""
                    For i = 0 To UBound(nomeSplit)
                      if(i = 0)then
                        nomeFinalEmi = nomeFinalEmi & nomeSplit(i) & " "
                      end if

                      if(i <> 0)then
                        if(Len(nomeSplit(i)) > 2)then
                          if(isEspolio)then
                            if(i = 1)then
                              nomeFinalEmi = nomeFinalEmi & nomeSplit(i) & " "
                            end if

                            if(i <> 1)then
                              nomeFinalEmi = nomeFinalEmi & Left(nomeSplit(i), 1) & "* "
                            end if
                          Else
                            nomeFinalEmi = nomeFinalEmi & Left(nomeSplit(i), 1) & "* "
                          end if
                        end if
                      end if
                    Next
                        'response.write nomeFinal
                        'response.end
                    %>
                  <tr>
                  
                    <td><%=rsConsultaMovimentacao("NumGTA")%></td>
                    <td><%=serie%></td>
                    <td><%=rsConsultaMovimentacao("Especie")%></td>
                    <td><%=(nomeFinal)%></td>
                    <td><%=rsConsultaMovimentacao("PropriedadeDestino")%></td>
                    <td><%=rsConsultaMovimentacao("MunicipioDestino")%></td>
                    <td><%=rsConsultaMovimentacao("EstadoDestino")%></td>
                    <td><%=rsConsultaMovimentacao("DataHoraEmissao")%></td>
                    <td><%=rsConsultaMovimentacao("TotalAnimais")%></td>
                    <td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal-<%=rsConsultaMovimentacao("NumGTA")%>"><i class="fa fa-eye fa-2x" ></button></i></td>
                  </tr>
                  <tr>
                  <td>
                <!-- Inicio Modal -->
                
                  <div class="modal fade" id="myModal-<%=rsConsultaMovimentacao("NumGTA")%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">GTA &nbsp&nbsp---&nbsp&nbsp UF - TO &nbsp&nbsp| Série - <%=serie%> &nbsp&nbsp| Numero - <%=rsConsultaMovimentacao("NumGTA")%></h4>
                        <button type="button" class="Close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">X</span>
                        </button>                      
                      </div>                    
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
                        <%elseif rsConsultamovimentacao("CodEspAnimal") = 7050 or rsConsultamovimentacao("CodEspAnimal") = 7070 or rsConsultamovimentacao("CodEspAnimal") = 7074 then%>
                        <div class="divDados">
                          <div class="form-group col-md">
                            <div class="tile-title">Atestados</div>
                            <label class="control"><strong>AIE:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(rsConsultamovimentacao("VerificaCodExameGripe"))%></label>
                          </div>
                          <div class="form-group col-md">
                            <div class="tile-title">&nbsp</div>
                            <label class="control"><strong>Gripe Equina:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("VerificaCodExameAIE"))%></label>
                          </div>                          
                        </div>
                        <%elseif rsConsultamovimentacao("CodEspAnimal") = 7500 or rsConsultamovimentacao("CodEspAnimal") = 7513 or rsConsultamovimentacao("CodEspAnimal") = 7602 or rsConsultamovimentacao("CodEspAnimal") = 7603 then%>
                        <div class="divDados">
                          <div class="form-group col-md">
                            <div class="tile-title">Atestados</div>
                          </div>
                          <div class="form-group col-md">
                            <div class="tile-title">Vacinações</div>
                          </div>                          
                        </div>                        
                        <%else%>
                        <div class="divDados">
                          <div class="form-group col-md">
                            <div class="tile-title">Vacinações</div>
                            <label class="control"><strong>Febre Aftosa:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(rsConsultamovimentacao("PenultimaVacinaFebreAftosa")) %> - <%=Ucase(rsConsultamovimentacao("UltimaVacinaFebreAftosa"))%></label>
                            <br>
                            <label class="control"><strong>Brucelose:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("VacinaBrucelose"))%></label>
                          </div>

                          <div class="form-group col-md">
                            <div class="tile-title">Atestados</div>
                            <label class="control"><strong>Brucelose:</strong>&nbsp&nbsp</label>
                            <label class="control-label "><%=Ucase(rsConsultamovimentacao("VerificaCodExameBrucelose"))%></label>
                            <br>
                            <label class="control"><strong>Tuberculose:</strong>&nbsp&nbsp</label>
                            <label class="control-label"><%=Ucase(rsConsultamovimentacao("VerificaCodExameTuberculose"))%></label>
                          </div>
                        </div>
                        <%end if%>
                        <%
'---------------------- BOVINOS/BUBALINOS --------------------------------                        
                        if rsConsultamovimentacao("CodEspAnimal") = 7010 or rsConsultamovimentacao("CodEspAnimal") = 7020 then

                        sql = "SELECT Convert(Varchar,TB_GTABovinosBubalinos.BovBub412Macho)+','+Convert(Varchar,TB_GTABovinosBubalinos.BovBub412Femea)+','+Convert(Varchar,TB_GTABovinosBubalinos.BovBub1224Macho)+','+Convert(Varchar,TB_GTABovinosBubalinos.BovBub1224Femea)+','+Convert(Varchar,TB_GTABovinosBubalinos.BovBub2436Macho)+','+Convert(Varchar,TB_GTABovinosBubalinos.BovBub2436Femea)+','+Convert(Varchar,TB_GTABovinosBubalinos.BovBub36Macho)+','+Convert(Varchar,TB_GTABovinosBubalinos.BovBub36Femea) as Estratificao FROM TB_GTA INNER JOIN TB_GTABovinosBubalinos ON TB_GTA.NumGTA = TB_GTABovinosBubalinos.NumGTA AND TB_GTA.SerieGTA = TB_GTABovinosBubalinos.SerieGTA INNER JOIN TB_EspecieAnimal ON TB_EspecieAnimal.CodEspAnimal = TB_GTA.CodEspAnimal WHERE (TB_GTA.NumGTA = '"&rsConsultaMovimentacao("NumGTA")&"') AND (TB_GTA.SerieGTA = '"&serie&"')"
                       
                        set rs = conn.execute(sql)
                        vetorEstratificacao = split(rs("Estratificao"),",")
                        
                        %>
                        <div class="divDados">
                          <div class="form-group col-md">
                          <div class="tile-title">Estratificação</div>
                            <table width="100%">
                              <tr>
                                <th>Espécie</th>
                                <th>Categoria</th>
                                <th>Faixa</th>
                                <th>Sexo</th>
                                <th>Quantidade</th>
                              </tr>
                              <%
                             
                              Dim vetorFaixaEtaria: vetorFaixaEtaria = Array("0 a 12 Meses", "0 a 12 Meses", "13 a 24 Meses", "13 a 24 Meses", "25 a 36 Meses", "25 a 36 Meses", "+36 Meses", "+36 Meses")
                              Dim vetorSexo: vetorSexo = Array("M", "F", "M", "F", "M", "F", "M", "F")
                              for i = 0 to UBOUND(vetorEstratificacao)
                                if vetorEstratificacao(i) > 0 then%>
                              <tr class="estrati">
                                <td><%if rsConsultamovimentacao("CodEspAnimal") = 7010 then%>BOVINOS<%elseif rsConsultamovimentacao("CodEspAnimal") = 7020 then%>BUBALINOS<%end if%></td>
                                <td>-</td>
                                <td><%=vetorFaixaEtaria(i)%></td>
                                <td><%=vetorSexo(i)%></td>
                                <td><%=vetorEstratificacao(i)%></td>
                              </tr>
                              <%end if%>
                              <%next%>
                              
                            </table>
                          </div>                        
                        </div>
<%
'---------------------- EQUINOS --------------------------------                        
                        elseif rsConsultamovimentacao("CodEspAnimal") = 7050 or rsConsultamovimentacao("CodEspAnimal") = 7070 or rsConsultamovimentacao("CodEspAnimal") = 7074 then

                        sql = "SELECT Convert(Varchar,TB_GTAEquideos.EquinoQtdMachos)+','+Convert(Varchar,TB_GTAEquideos.EquinoQtdMachos)+','+Convert(Varchar,TB_GTAEquideos.EquinoQtdFemeas)+','+Convert(Varchar,TB_GTAEquideos.EquinoQtdMachosMais6)+','+Convert(Varchar,TB_GTAEquideos.EquinoQtdFemeasMais6)+','+Convert(Varchar,TB_GTAEquideos.AsininoQtdMachos)+','+Convert(Varchar,TB_GTAEquideos.AsininoQtdFemeas)+','+Convert(Varchar,TB_GTAEquideos.AsininoQtdMachosMais6)+','+Convert(Varchar,TB_GTAEquideos.AsininoQtdFemeasMais6)+','+Convert(Varchar,TB_GTAEquideos.MuarQtdMachos)+','+Convert(Varchar,TB_GTAEquideos.MuarQtdFemeas)+','+Convert(Varchar,TB_GTAEquideos.MuarQtdMachosMais6)+','+Convert(Varchar,TB_GTAEquideos.MuarQtdFemeasMais6) as EstratificacaoEquinos FROM TB_GTA INNER JOIN TB_GTAEquideos ON TB_GTAEquideos.NumGTA = TB_GTA.NumGTA AND TB_GTAEquideos.SerieGTA = TB_GTA.SerieGTA INNER JOIN TB_EspecieAnimal ON TB_EspecieAnimal.CodEspAnimal = TB_GTA.CodEspAnimal WHERE (TB_GTA.NumGTA = '"&rsConsultaMovimentacao("NumGTA")&"') AND (TB_GTA.SerieGTA = '"&Trim(serie)&"')"
                        'response.write sql
                        'response.end
                        set rs = conn.execute(sql)
                        vetorEstratificacaoEqui = split(rs("EstratificacaoEquinos"),",")

                        %>
                        <div class="divDados">
                          <div class="form-group col-md">
                          <div class="tile-title">Estratificação</div>
                            <table width="100%">
                              <tr>
                                <th>Espécie</th>
                                <th>Categoria</th>
                                <th>Faixa</th>
                                <th>Sexo</th>
                                <th>Quantidade</th>
                              </tr>
                              <%
                             
                              Dim vetorFaixaEtariaEqui: vetorFaixaEtariaEqui = Array("0 a 6 Anos", "0 a 6 Anos", "+6 Anos", "+6 Anos", "0 a 6 Anos", "0 a 6 Anos", "+6 Anos", "+6 0 a 6 Anos", "0 a 6 Anos", "0 a 6 Anos", "+6 Anos", "+6 Anos")
                              Dim vetorSexoEqui: vetorSexoEqui = Array("M", "F", "M", "F", "M", "F", "M", "F", "M", "F", "M", "F")
                              for i = 0 to UBOUND(vetorEstratificacaoEqui)
                                if vetorEstratificacaoEqui(i) > 0 then%>
                              <tr class="estrati">
                                <td><%if rsConsultamovimentacao("CodEspAnimal") = 7050 then%>EQUINOS<%elseif rsConsultamovimentacao("CodEspAnimal") = 7070 then%>MUARES<%elseif rsConsultamovimentacao("CodEspAnimal") = 7074 then%>ASININOS<%end if%></td>
                                <td>-</td>
                                <td><%=vetorFaixaEtariaEqui(i)%></td>
                                <td><%=vetorSexoEqui(i)%></td>
                                <td><%=vetorEstratificacaoEqui(i)%></td>
                              </tr>
                                <%end if%>
                              <%next%>
                              
                            </table>
                          </div>                        
                        </div>                          

<%
'---------------------- CAPRINOS/OVINOS --------------------------------                        
                        elseif rsConsultamovimentacao("CodEspAnimal") = 7040 or rsConsultamovimentacao("CodEspAnimal") = 7080 then

                        sql = "SELECT Convert(Varchar,TB_GTACaprinosOvinos.QtdMachos)+','+Convert(Varchar,TB_GTACaprinosOvinos.QtdFemeas)+','+Convert(Varchar,TB_GTACaprinosOvinos.QtdMachosMais6)+','+Convert(Varchar,TB_GTACaprinosOvinos.QtdFemeasMais6) as EstratificacaoOvinos FROM TB_GTA INNER JOIN TB_GTACaprinosOvinos ON TB_GTACaprinosOvinos.NumGTA = TB_GTA.NumGTA AND TB_GTACaprinosOvinos.SerieGTA = TB_GTA.SerieGTA where (TB_GTA.NumGTA = '"&rsConsultaMovimentacao("NumGTA")&"') AND (TB_GTA.SerieGTA = '"&serie&"')"
                       
                        set rs = conn.execute(sql)
                        vetorEstratificacao = split(rs("EstratificacaoOvinos"),",")
                        
                        %>
                        <div class="divDados">
                          <div class="form-group col-md">
                          <div class="tile-title">Estratificação</div>
                            <table width="100%">
                              <tr>
                                <th>Espécie</th>
                                <th>Categoria</th>
                                <th>Faixa</th>
                                <th>Sexo</th>
                                <th>Quantidade</th>
                              </tr>
                              <%
                             
                              Dim vetorFaixaEtariaCapri: vetorFaixaEtariaCapri = Array("0 a 6 Anos", "0 a 6 Anos", "+6 Anos", "+6 Anos")
                              Dim vetorSexoCapri: vetorSexoCapri = Array("M", "F", "M", "F")
                              for i = 0 to UBOUND(vetorEstratificacao)
                                if vetorEstratificacao(i) > 0 then%>
                              <tr class="estrati">
                                <td><%if rsConsultamovimentacao("CodEspAnimal") = 7040 then%>CAPRINOS<%elseif rsConsultamovimentacao("CodEspAnimal") = 7080 then%>OVINOS<%end if%></td>
                                <td>-</td>
                                <td><%=vetorFaixaEtariaCapri(i)%></td>
                                <td><%=vetorSexoCapri(i)%></td>
                                <td><%=vetorEstratificacao(i)%></td>
                              </tr>
                                <%end if%>
                              <%next%>
                              
                            </table>
                          </div>                        
                        </div>

<%
'---------------------- SUINOS --------------------------------                        
                        elseif rsConsultamovimentacao("CodEspAnimal") = 7091 or rsConsultamovimentacao("CodEspAnimal") = 7090 or rsConsultamovimentacao("CodEspAnimal") = 7600 or rsConsultamovimentacao("CodEspAnimal") = 7601 then

                        sql = "SELECT top(200)Convert(Varchar,TB_GTASuideos.Suideo02Femea)+','+Convert(Varchar,TB_GTASuideos.Suideo34Macho)+','+Convert(Varchar,TB_GTASuideos.Suideo34Femea)+','+Convert(Varchar,TB_GTASuideos.Suideo56Macho)+','+Convert(Varchar,TB_GTASuideos.Suideo56Femea)+','+Convert(Varchar,TB_GTASuideos.SuideoCachacos)+','+Convert(Varchar,TB_GTASuideos.SuideoMatrizes) as EstratificacaoSuinos FROM TB_GTA inner join TB_GTASuideos on TB_GTASuideos.NumGTA = TB_GTA.NumGTA and TB_GTASuideos.SerieGTA = TB_GTA.SerieGTA where (TB_GTA.NumGTA = '"&rsConsultaMovimentacao("NumGTA")&"') AND (TB_GTA.SerieGTA = '"&serie&"')"
                       
                        set rs = conn.execute(sql)
                        vetorEstratificacao = split(rs("EstratificacaoSuinos"),",")
                        
                        %>
                        <div class="divDados">
                          <div class="form-group col-md">
                          <div class="tile-title">Estratificação</div>
                            <table width="100%">
                              <tr>
                                <th>Espécie</th>
                                <th>Categoria</th>
                                <th>Faixa</th>
                                <th>Sexo</th>
                                <th>Quantidade</th>
                              </tr>
                              <%
                             
                              Dim vetorFaixaEtariaSuinos: vetorFaixaEtariaSuinos = Array("0 a 2 Meses", "0 a 2 Meses", "3 a 4 Meses", "3 a 4 Meses", "5 a 6 Meses", "5 a 6 Meses", "Cachacos", "Matrizes")
                              Dim vetorSexoSuinos: vetorSexoSuinos = Array("M", "F", "M", "F","M", "F", "M", "F")
                              for i = 0 to UBOUND(vetorEstratificacao)
                                if vetorEstratificacao(i) > 0 then%>
                              <tr class="estrati">
                                <td><%if rsConsultamovimentacao("CodEspAnimal") = 7090 then%>SUINOS<%elseif rsConsultamovimentacao("CodEspAnimal") = 7091 then%>JAVALI<%elseif rsConsultamovimentacao("CodEspAnimal") = 7600 then%>CATETO<%elseif rsConsultamovimentacao("CodEspAnimal") = 7601 then%>QUEIXADA<%end if%></td>
                                <td>-</td>
                                <td><%=vetorFaixaEtariaSuinos(i)%></td>
                                <td><%=vetorSexoSuinos(i)%></td>
                                <td><%=vetorEstratificacao(i)%></td>
                              </tr>
                                <%end if%>
                              <%next%>
                              
                            </table>
                          </div>                        
                        </div>

<%
'---------------------- AVES --------------------------------                        
                        elseif rsConsultamovimentacao("CodEspAnimal") = 7100 or rsConsultamovimentacao("CodEspAnimal") = 7140 or rsConsultamovimentacao("CodEspAnimal") = 7130 or rsConsultamovimentacao("CodEspAnimal") = 7170 or rsConsultamovimentacao("CodEspAnimal") = 7184 or rsConsultamovimentacao("CodEspAnimal") = 7197 then

                        sql = "SELECT TB_EspecieAnimal.DescEspAnimal, TB_GTA.Produto, TB_GTA.Categoria, TB_GTA.Aptidao, TB_GTA.TotalAnimais FROM TB_GTA INNER JOIN TB_EspecieAnimal ON TB_EspecieAnimal.CodEspAnimal = TB_GTA.CodEspAnimal where (TB_GTA.NumGTA = '"&rsConsultaMovimentacao("NumGTA")&"') AND (TB_GTA.SerieGTA = '"&serie&"')"
                       
                        set rs = conn.execute(sql)
                        'vetorEstratificacao = split(rs("EstratificacaoSuinos"),",")
                        
                        %>
                        <div class="divDados">
                          <div class="form-group col-md">
                          <div class="tile-title">Estratificação</div>
                            <table width="100%">
                              <tr>
                                <th>Espécie</th>
                                <th>Produto</th>
                                <th>Categoria</th>
                                <th>Aptidão</th>
                                <th>Quantidade</th>
                              </tr>
                              <%
                             
                              'Dim vetorFaixaEtariaSuinos: vetorFaixaEtariaSuinos = Array("0 a 2 Meses", "0 a 2 Meses", "3 a 4 Meses", "3 a 4 Meses", "5 a 6 Meses", "5 a 6 Meses", "Cachacos", "Matrizes")
                              'Dim vetorSexoSuinos: vetorSexoSuinos = Array("M", "F", "M", "F","M", "F", "M", "F")
                             ' for i = 0 to UBOUND(vetorEstratificacao)
                               ' if vetorEstratificacao(i) > 0 then%>
                              <tr class="estrati">
                                <td><%if rsConsultamovimentacao("CodEspAnimal") = 7100 then%>GALINHAS<%elseif rsConsultamovimentacao("CodEspAnimal") = 7140 then%>CODORNA CHINESA<%elseif rsConsultamovimentacao("CodEspAnimal") = 7130 then%>PERUS<%elseif rsConsultamovimentacao("CodEspAnimal") = 7170 then%>GALINHAS D'ANGOLA<%elseif rsConsultamovimentacao("CodEspAnimal") = 7184 then%>EMAS<%elseif rsConsultamovimentacao("CodEspAnimal") = 7197 then%>AVESTRUZES<%end if%></td>
                                <td><%=rs("Produto")%></td>
                                <td><%=rs("Categoria")%></td>
                                <td><%=rs("Aptidao")%></td>
                                <td><%=rs("TotalAnimais")%></td>
                              </tr>
                                <%'end if%>
                              <%'next%>
                              
                            </table>
                          </div>                        
                        </div>
<%
'---------------------- PEIXES --------------------------------                        
                        elseif rsConsultamovimentacao("CodEspAnimal") = 7500 or rsConsultamovimentacao("CodEspAnimal") = 7513 or rsConsultamovimentacao("CodEspAnimal") = 7602 or rsConsultamovimentacao("CodEspAnimal") = 7603 then

                        sql = "SELECT TB_EspecieAnimal.DescEspAnimal, TB_GTA.Produto, TB_GTA.Categoria, TB_GTA.Aptidao, TB_GTA.TotalAnimais FROM TB_GTA INNER JOIN TB_EspecieAnimal ON TB_EspecieAnimal.CodEspAnimal = TB_GTA.CodEspAnimal where (TB_GTA.NumGTA = '"&rsConsultaMovimentacao("NumGTA")&"') AND (TB_GTA.SerieGTA = '"&serie&"')"
                       
                        set rs = conn.execute(sql)
                        'vetorEstratificacao = split(rs("EstratificacaoSuinos"),",")
                        
                        %>
                        <div class="divDados">
                          <div class="form-group col-md">
                          <div class="tile-title">Estratificação</div>
                            <table width="100%">
                              <tr>
                                <th>Espécie</th>
                                <th>Produto</th>
                                <th>Unidade Medida</th>
                                <th>Categoria</th>
                                <th>Quantidade</th>
                              </tr>
                              <%
                             
                              'Dim vetorFaixaEtariaSuinos: vetorFaixaEtariaSuinos = Array("0 a 2 Meses", "0 a 2 Meses", "3 a 4 Meses", "3 a 4 Meses", "5 a 6 Meses", "5 a 6 Meses", "Cachacos", "Matrizes")
                              'Dim vetorSexoSuinos: vetorSexoSuinos = Array("M", "F", "M", "F","M", "F", "M", "F")
                             ' for i = 0 to UBOUND(vetorEstratificacao)
                               ' if vetorEstratificacao(i) > 0 then%>
                              <tr class="estrati">
                                <td><%if rsConsultamovimentacao("CodEspAnimal") = 7500 then%>PEIXES<%elseif rsConsultamovimentacao("CodEspAnimal") = 7513 then%>ANFÍBIOS<%elseif rsConsultamovimentacao("CodEspAnimal") = 7602 then%>CRUSTÁCEOS<%elseif rsConsultamovimentacao("CodEspAnimal") = 7603 then%>MOLUSCOS<%end if%></td>
                                <td><%=rs("Produto")%></td>
                                <td><%=rs("Aptidao")%></td>
                                <td>-</td>
                                <td><%=rs("TotalAnimais")%></td>
                              </tr>
                                <%'end if%>
                              <%'next%>
                              
                            </table>
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
                  </td>
                  </tr>
                    <% 
                      rsConsultaMovimentacao.movenext
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
      </div>
    </div>