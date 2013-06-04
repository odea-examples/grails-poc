

<%@ page import="templatesexample.Libro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
        <title><g:message code="default.edit.label" args='[entityName, "${libroInstance}"]' default="Edit Libro - ${' ' + libroInstance}" encodeAs="HTML" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" encodeAs="HTML" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" encodeAs="HTML" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args='[entityName, "${libroInstance}"]' default="Edit Libro - ${' ' + libroInstance}" encodeAs="HTML"/></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" encodeAs="HTML"/></div>
            </g:if>
            <g:hasErrors bean="${libroInstance}">
            <div class="errors">
                <g:renderErrors bean="${libroInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="libro" >
                <fieldset>
                <g:hiddenField name="id" value="${libroInstance?.compositeId}" />
                <g:hiddenField name="version" value="${libroInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop" title="${message(code:'libro.autor.hint' , default: 'Autor', encodeAs:'HTML')}">
                                <td valign="top" class="name">
                                	<label for="autor">
									<g:message code="libro.autor.label" default="Autor" encodeAs="HTML" />
                                	</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: libroInstance, field: 'autor', 'errors')}">
                                    <g:select id="autor" name="autor.id" from="${templatesexample.Autor.list().sort()}" optionKey="id" value="${libroInstance?.autor?.compositeId}" noSelection="['null': message(code:'default.choose.required', default:'Select one')]" />
                                </td>
                            </tr>
                        
                            <tr class="prop" title="${message(code:'libro.nombre.hint' , default: 'Nombre', encodeAs:'HTML')}">
                                <td valign="top" class="name">
                                	<label for="nombre">
									<g:message code="libro.nombre.label" default="Nombre" encodeAs="HTML" />
                                	</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: libroInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${libroInstance?.nombre}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
	                <div class="buttons">
	                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update', encodeAs:'HTML')}" /></span>
	                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete', encodeAs:'HTML')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?', encodeAs:'HTML')}');" /></span>
	                </div>
                </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
