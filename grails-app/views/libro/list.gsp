
<%@ page import="templatesexample.Libro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
        <title><g:message code="default.list.label" args="[entityName]" encodeAs="HTML"/></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" encodeAs="HTML" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" encodeAs="HTML"/></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" encodeAs="HTML"/></div>
            </g:if>
            
            <g:hasErrors bean="${libroInstance}">
            <div class="errors">
                <g:renderErrors bean="${libroInstance}" as="list" />
            </div>
            </g:hasErrors>
            
			<g:form action="list" method="post" >
				<fieldset>
					<!-- do not forget sort and order criteria -->
					<g:hiddenField name="sort" value="${params.sort}" />
					<g:hiddenField name="order" value="${params.order}" />
	
					<!-- do not forget source for associating existing objects -->
					<g:if test="${params.callback}">
						<g:hiddenField name="callback" value="${params.callback}" />
					</g:if>
					<g:if test="${params.source}">
						<g:hiddenField name="source" value="${params.source}" />
					</g:if>
					<g:if test="${params.source_id}">
						<g:hiddenField name="source_id" value="${params.source_id}" />
					</g:if>
					<g:if test="${params.class}">
						<g:hiddenField name="class" value="${params.class}" />
					</g:if>
					<g:if test="${params.dest}">
						<g:hiddenField name="dest" value="${params.dest}" />
					</g:if>
					<g:if test="${params.refDest}">
						<g:hiddenField name="refDest" value="${params.refDest}" />
					</g:if>
		
		            <g:if test="${!libroInstanceList}">
						<g:message code="default.list.empty" default="No records available." encodeAs="HTML"/>
					</g:if>            
					<g:else>
		            <div class="list">
		                <table>
		                    <thead>
		                        <tr>
		                        	<th>&nbsp;</th>
		                        
												<th class="notsortable"><g:message code="libroInstance.autor" default="Autor" encodeAs="HTML"/></th>
																		
					                   	        <g:sortableColumn params="${(!sortableParams.isEmpty()?sortableParams:"")}" property="nombre" title="Nombre" titleKey="libro.nombre.label" />
															
		                        </tr>
		                    </thead>
		                    <tbody> 
		                        <tr> 
		                        	<td>&nbsp;</td>
		                        	 
										<td>
											<g:select style="" onchange="submit();" noSelection="['-2147483648':message(code:'default.list.filter', default:'filter', encodeAs:'HTML')]" optionKey="id" from="${templatesexample.Autor.executeQuery('select distinct a from templatesexample.Autor as a, Libro as b where a=b.autor').sort()}" name="filter.autor" value="${params.filter?.autor}" optionValue="" valueMessagePrefix=""></g:select>
										</td>
								
										<td>
											<g:select style="" onchange="submit();" noSelection="['-2147483648':message(code:'default.list.filter', default:'filter', encodeAs:'HTML')]" optionKey="" from="${Libro.executeQuery('select distinct a.nombre from Libro as a where a.nombre is not null and length(a.nombre)>0 order by a.nombre')}" name="filter.nombre" value="${params.filter?.nombre}" optionValue="" valueMessagePrefix=""></g:select>
										</td>
								</tr>
							
							
		                  
		                  
		                  	<g:each in="${libroInstanceList}" status="i" var="libroInstance">
		                      		<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
		                      
				                    <td>
				   						<g:if test="${params.callback}"> 
				   							<g:link action="choose" params="${params}" id="${libroInstance.compositeId}"><img src='<g:resource dir="images/skin" file="database_add.png"/>' alt="Associate"/></g:link>
										</g:if>  
										<g:if test="${params?.callback==null}"> 
											<g:link action="show"   id="${libroInstance.compositeId}"><img src='<g:resource dir="images/skin" file="information.png"/>' alt="Show"/></g:link>
											<g:link action="edit"   id="${libroInstance.compositeId}"><img src='<g:resource dir="images/skin" file="database_edit.png"/>' alt="Edit"/></g:link>
											<g:link action="delete" id="${libroInstance.compositeId}" onclick="return confirm('${message(code:'default.button.delete.confirm.message', default:'Are you sure?', encodeAs:'HTML')}');"><img src='<g:resource dir="images/skin" file="database_delete.png"/>' alt="Delete"/></g:link>
				                    	</g:if>  	
				                    </td>
					            
									<td class="value"><g:link controller="autor" action="show" id="${libroInstance?.autor?.compositeId}">${fieldValue(bean:libroInstance, field:"autor")}</g:link>&nbsp;</td>
											 
			                        <td class="value">${fieldValue(bean:libroInstance, field:"nombre")}&nbsp;</td>
			                        		
		                     	</tr>
		                </g:each>
		                		<tr>
		                			<td class="paginateButtons" colspan="100%">
							            <div class="">
											<g:paginate max="20" params="${params.findAll{ k,v -> k != 'filter' && k!= 'offset'}}" total="${paginateTotal}" />
		           						</div>
		           					</td>
		           				</tr>
		                    </tbody>
		                </table>
		            </div>
					</g:else>
        		</fieldset>
			</g:form>
        </div>
    </body>
</html>
