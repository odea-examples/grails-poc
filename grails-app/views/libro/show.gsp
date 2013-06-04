
<%@ page import="templatesexample.Libro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
        <title><g:message code="default.show.label" args='[entityName, "${libroInstance}"]' default="Show Libro - ${' ' + libroInstance}" encodeAs="HTML" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" encodeAs="HTML" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" encodeAs="HTML" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args='[entityName, "${libroInstance}"]' default="Show Libro - ${' ' + libroInstance}" encodeAs="HTML" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" encodeAs="HTML"/></div>
            </g:if>
            <g:form>
            	<fieldset>
                <g:hiddenField name="id" value="${libroInstance?.compositeId}" />
            
	            <div class="dialog">
	                <table>
	                    <tbody>
	                    
	                        <tr class="prop" title="${message(code:'libro.autor.hint' , default: 'Autor', encodeAs:'HTML')}">
	                            <td class="name"><g:message code="libro.autor.label" default="Autor" encodeAs="HTML" /></td>
	                            
	                            <td class="value"><g:link controller="autor" action="show" id="${libroInstance?.autor?.compositeId}">${libroInstance?.autor?.encodeAsHTML()}</g:link>&nbsp;</td>
	                            
	                        </tr>
		                    
	                        <tr class="prop" title="${message(code:'libro.nombre.hint' , default: 'Nombre', encodeAs:'HTML')}">
	                            <td class="name"><g:message code="libro.nombre.label" default="Nombre" encodeAs="HTML" /></td>
	                            
	                        	<td class="value">${fieldValue(bean:libroInstance, field:"nombre")}&nbsp;</td>
	                        		
	                        </tr>
		                    
		               	</tbody>
	                </table>
		            <div class="buttons">
	                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit', encodeAs:'HTML')}" /></span>
	                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete', encodeAs:'HTML')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?', encodeAs:'HTML')}');" /></span>
		            </div>
	            </div>
	        	</fieldset>
			</g:form>
        </div>
    </body>
</html>
