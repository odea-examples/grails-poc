<%@ page import="templatesexample.Autor" %>



<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'libros', 'error')} ">
	<label for="libros">
		<g:message code="autor.libros.label" default="Libros" />
		
	</label>
	
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

</div>

<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="autor.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${autorInstance?.nombre}" />
</div>

