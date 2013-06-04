

<%@ page import="templatesexample.Libro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
        <title><g:message code="default.create.label" args="[entityName]" encodeAs="HTML"/></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" encodeAs="HTML" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" encodeAs="HTML" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" encodeAs="HTML"/></div>
            </g:if>
            <g:hasErrors bean="${libroInstance}">
            <div class="errors">
                <g:renderErrors bean="${libroInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="libro" action="save" >
            	<fieldset>
				
				<!-- do not forget source for adding to other objects -->
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
	                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create', encodeAs:'HTML')}" /></span>
	                </div>
                </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
