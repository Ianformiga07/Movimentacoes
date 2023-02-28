<%
function ceil(x)
  dim temp
  temp = Round(x)
  if temp < x then
	temp = temp + 1
  end if
  ceil = temp
end function

'INICIA A PAGINAÇÃO
if (CSng(Linhas) > CSng(Limite))then
	PageProx = CSng(Pagina) + CSng(1)
	PageAnt = CSng(Pagina) - CSng(1)
	PageUltima = ceil(CSng(Linhas) / CSng(Limite))
	PagePenultima = CSng(PageUltima) - CSng(1)
	PageAdjacentes = CSng(2)

    %>
	<div class="col-sm-12">
		<div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
			<ul class="pagination" style="float:right">
				<%
				'---------------------------------------------------------------------------------------------------
				if (Pagina > 1 AND PageUltima > 5)then
					response.write "<li class=""paginate_button page-item previous""><a href=""#"" class=""jq-paginacao page-link"" data-pagina="& PageAnt &">&laquo; Anterior</a></li>"	    
				else
					response.write ""
				end if
				'---------------------------------------------------------------------------------------------------
				if (PageUltima <= 5)then
					for PageI = 1 to PageUltima
						if (PageI = Pagina)then
							response.write "<li class=""paginate_button page-item active""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PageI &">"& PageI &"</a></li>"
						else
							response.write "<li class=""paginate_button page-item""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PageI &">"& PageI &"</a></li>"
						end if
					next
				end if
				'---------------------------------------------------------------------------------------------------
				if (PageUltima > 5)then 
					'---------------------------------------------------------------------------------------
					if (Pagina < 1 + (2 * PageAdjacentes))then
						for PageI = 1 to 1 + (2 * PageAdjacentes)
							if (PageI = Pagina)then
								response.write "<li class=""paginate_button page-item active""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PageI &">"& PageI &"</a></li>"
							else
								response.write "<li class=""paginate_button page-item""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PageI &">"& PageI &"</a></li>"
							end if
						next
						response.write "<li> ... </li>"
						response.write "<li class=""paginate_button page-item""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PagePenultima &">"& PagePenultima &"</a></li>"
						response.write "<li class=""paginate_button page-item""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PageUltima &">"& PageUltima &"</a></li>"
					'---------------------------------------------------------------------------------------
					elseif (Pagina > (2 * PageAdjacentes) AND Pagina < PageUltima - 3)then
						response.write "<li class=""paginate_button page-item""><a href=""#"" class="" jq-paginacao page-link"" data-pagina=""1"">1</a></li>"
						response.write "<li class=""paginate_button page-item""><a href=""#"" class="" jq-paginacao page-link"" data-pagina=""2"">2</a><li> ... </li>"
						for PageI = Pagina - PageAdjacentes to Pagina + PageAdjacentes
							if (PageI = Pagina)then
								response.write "<li class=""paginate_button page-item active""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PageI &">"& PageI &"</a></li>"
							else
								response.write "<li class=""paginate_button page-item""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PageI &">"& PageI &"</a></li>"
							end if
						next
						response.write "<li> ... </li>"
						response.write "<li class=""paginate_button page-item""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PagePenultima &">"& PagePenultima &"</a></li>"
						response.write "<li class=""paginate_button page-item""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PageUltima &">"& PageUltima &"</a></li>"
					'---------------------------------------------------------------------------------------
					else
						response.write "<li class=""paginate_button page-item""><a href=""#"" class="" jq-paginacao page-link"" data-pagina=""1"">1</a></li>"
						response.write "<li class=""paginate_button page-item""><a href=""#"" class="" jq-paginacao page-link"" data-pagina=""2"">2</a></li><li> ... </li>"
						for PageI = PageUltima - (4 + (2 * 0)) to PageUltima
							if (PageI = Pagina)then
								response.write "<li class=""paginate_button page-item active""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PageI &">"& PageI &"</a></li>"
							else
								response.write "<li class=""paginate_button page-item""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PageI &">"& PageI &"</a></li>"
							end if
						next
					end if
				'---------------------------------------------------------------------------------------	
				end if
				'---------------------------------------------------------------------------------------------------
				if (PageProx <= PageUltima AND PageUltima > 5)then
					response.write "<li class=""paginate_button page-item next""><a href=""#"" class="" jq-paginacao page-link"" data-pagina="& PageProx &">Próxima &raquo;</a></li>"
				end if
				%>
			</ul>
		</div>
	</div>
	<%
end if 
%>