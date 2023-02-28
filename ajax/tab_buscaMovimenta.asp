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
                    <th>Desc Animal</th>
                    <th>Data</th>
                    <th>Total Animais</th>
                    <th>Destino</th>
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
                    %>
                  <tr>
                  
                    <td><%=rsConsultaMovimentacao("NumGTA")%></td>
                    <td><%=rsConsultaMovimentacao("SerieGTA")%></td>
                    <td><%=rsConsultaMovimentacao("DescEspAnimal")%></td>
                    <td><%=rsConsultaMovimentacao("DataHoraEmissao")%></td>
                    <td><%=rsConsultaMovimentacao("TotalAnimais")%></td>
                    <td><%=rsConsultaMovimentacao("EstabDest")%></td>
                    <td><i class="fa fa-eye fa-2x" ></i></td>
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