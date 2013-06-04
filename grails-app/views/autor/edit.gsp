

<%@ page import="templatesexample.Autor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'autor.label', default: 'Autor')}" />
        <title><g:message code="default.edit.label" args='[entityName, "${autorInstance}"]' default="Edit Autor - ${' ' + autorInstance}" encodeAs="HTML" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" encodeAs="HTML" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" encodeAs="HTML" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args='[entityName, "${autorInstance}"]' default="Edit Autor - ${' ' + autorInstance}" encodeAs="HTML"/></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" encodeAs="HTML"/></div>
            </g:if>
            <g:hasErrors bean="${autorInstance}">
            <div class="errors">
                <g:renderErrors bean="${autorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="autor" >
                <fieldset>
                <g:hiddenField name="id" value="${autorInstance?.compositeId}" />
                <g:hiddenField name="version" value="${autorInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop" title="${message(code:'autor.libros.hint' , default: 'Libros', encodeAs:'HTML')}">
                                <td valign="top" class="name">
                                	
									<g:message code="autor.libros.label" default="Libros" encodeAs="HTML" />
                                	
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: autorInstance, field: 'libros', 'errors')}">
                                    
<g:if test="${autorInstance?.libros?.size()>0}" >
<ul>
<g:each in="${autorInstance?.libros?.sort()}" var="l" >
    <li>
      <g:link controller="libro" action="show" id="${l.compositeId}">${l?.encodeAsHTML()}</g:link>
    </li>
</g:each>
</ul>
</g:if>
<g:link controller="libro" params="['class':'templatesexample.Autor','dest':'libros', 'source_id':autorInstance?.compositeId,'source':'autor','refDest':'autor', 'autor.id':autorInstance?.compositeId]" action="create">${message(code: 'default.add.label', args: [message(code: 'libro.label', default: 'Libro')], encodeAs='HTML')}</g:link>
<g:if test="${(!autorInstance.libros && templatesexample.Libro.count()>0) || ((templatesexample.Libro.count()-autorInstance?.libros?.size())>0)}">
<br />
<g:link controller="libro" params="['source_id':autorInstance?.compositeId, 'source':'autor', 'class':'templatesexample.Autor', 'dest':'libros', 'refDest':'autor', 'callback':'link']" action="list" class="save">${message(code: 'default.associate.label', args: [message(code: 'libro.label', default: 'Libro')], encodeAs='HTML')}</g:link>
</g:if>

                                </td>
                            </tr>
                        
                            <tr class="prop" title="${message(code:'autor.nombre.hint' , default: 'Nombre', encodeAs:'HTML')}">
                                <td valign="top" class="name">
                                	<label for="nombre">
									<g:message code="autor.nombre.label" default="Nombre" encodeAs="HTML" />
                                	</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: autorInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${autorInstance?.nombre}" />
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
