
<!-- Imports -->
<%@page import="Clases.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Tutorial"%>
<%@page import="Clases.Gestiones"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<!-- Configuracion pagina -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "templates/header.jsp" %><!-- Header -->
<%@include file= "templates/lateral.jsp" %>  <!-- Lateral y barra de navegacion -->
<% 
    String alert = request.getParameter("alert"); //Recibe alerta para sweet alert 
    if (alert!=null){//Prevenir errores
        if(alert.equals("anadido")){ //Caso de añadido exitoso
       
%>
<script>
    $(document).ready(function () {
        anadido();
    });
</script>
<%
        }else if(alert.equals("anadida")){
        %>
<script>
    $(document).ready(function () {
        anadida();
    });
</script>
<%
        }
}
    
%>
<script>
     /**
     * FUNCIONES SWEET ALERT
     * @returns {undefined}
     */
            function anadido() {
                // Utiliza la librería Swal para mostrar una notificación de éxito
                Swal.fire({
                    icon: 'success', // Icono de éxito
                    title: 'Tutorial añadido!', // Título de la notificación
                    text: '¡Puedes verlo en la tabla de tutoriales!', // Texto de la notificación
                    showConfirmButton: false, // No muestra el botón de confirmación
                    timer: 1500 // Tiempo de duración de la notificación (en milisegundos)
                })
            }
            // Definición de la función 'añadido()'
                  function anadida() {
                      // Utiliza la librería Swal para mostrar una notificación de éxito
                      Swal.fire({
                          icon: 'success', // Icono de éxito
                          title: 'Categoria añadida!', // Título de la notificación
                          text: '¡Puedes verlo en la tabla de categorias!', // Texto de la notificación
                          showConfirmButton: false, // No muestra el botón de confirmación
                          timer: 1500 // Tiempo de duración de la notificación (en milisegundos)
                      })
                  }
</script>

</body>

</html>