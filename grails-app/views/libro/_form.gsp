<%@ page import="templatesexample.Libro" %>



<div class="fieldcontain ${hasErrors(bean: libroInstance, field: 'autor', 'error')} required">
	<label for="autor">
		<g:message code="libro.autor.label" default="Autor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="autor" name="autor.id" from="${templatesexample.Autor.list().sort()}" optionKey="id" value="${libroInstance?.autor?.compositeId}" noSelection="['null': message(code:'default.choose.required', default:'Select one')]" />
</div>

<div class="fieldcontain ${hasErrors(bean: libroInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="libro.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${libroInstance?.nombre}" />
</div>

