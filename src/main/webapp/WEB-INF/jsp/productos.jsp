<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.iesvegademijas.model.Producto"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Productos</title>
<style>
.clearfix::after {
	content: "";
	display: block;
	clear: both;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jspf"%>
	<%@ include file="/WEB-INF/jsp/nav.jspf"%>
	<main>
		<section>
			<div id="contenedora"
				style="float: none; margin: 0 auto; width: 900px;">
				<div class="clearfix">
					<div style="float: left; width: 50%">
						<h1>Productos</h1>
					</div>
					<div
						style="float: none; width: auto; overflow: hidden; min-height: 80px; position: relative;">

						<div style="position: absolute; left: 39%; top: 39%;">

							<form action="/tienda_informatica/productos/crear">
								<input type="submit" value="Crear">
							</form>
						</div>
						<form action="/tienda_informatica/productos/">
							<input type="text" name="nombre-producto"> <input
								type="submit" value="buscar">
						</form>
					</div>
				</div>
				<div class="clearfix">
					<hr />
				</div>
				<div class="clearfix">
					<div style="float: left; width: 10%">Código</div>
					<div style="float: left; width: 30%">Nombre</div>
					<div style="float: left; width: 13%">Precio</div>
					<div style="float: left; width: 27%">Codigo_Fabricante</div>
					<div style="float: none; width: 20%; overflow: hidden;">Acción</div>

				</div>
				<div class="clearfix">
					<hr />
				</div>
				<%
				if (request.getAttribute("listaProductos") != null) {
					List<Producto> listaProducto = (List<Producto>) request.getAttribute("listaProductos");

					for (Producto producto : listaProducto) {
				%>

				<div style="margin-top: 6px;" class="clearfix">
					<div style="float: left; width: 10%"><%=producto.getCodigo()%></div>
					<div style="float: left; width: 30%"><%=producto.getNombre()%></div>
					<div style="float: left; width: 20%"><%=Math.round(producto.getPrecio() * 100.0) / 100.0%>€
					</div>
					<div style="float: left; width: 15%"><%=producto.getCodigoFabricante()%></div>
					<div style="display: inline-flex; width: 25%; overflow: hidden;">
						<form
							action="/tienda_informatica/productos/<%=producto.getCodigo()%>"
							style="display: inline">
							<input type="submit" value="Ver Detalle" />
						</form>
						<form
							action="/tienda_informatica/productos/editar/<%=producto.getCodigo()%>"
							style="display: inline;">
							<input type="submit" value="Editar" />
						</form>
						<form action="/tienda_informatica/productos/borrar/" method="post"
							style="display: inline;">
							<input type="hidden" name="__method__" value="delete" /> <input
								type="hidden" name="codigo" value="<%=producto.getCodigo()%>" />
							<input type="submit" value="Eliminar" />
						</form>
					</div>
				</div>

				<%
				}
				} else {
				%>
				No hay registros de productos
				<%
				}
				%>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/jsp/footer.jspf"%>
</body>
</html>