
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
    
    System.out.println(alert);
     if (alert!=null){//Prevenir errores
        if(alert.equals("anadido")){ //Caso de añadido exitoso
       
%>
<script>
    $(document).ready(function () {
        anadido();
    });
</script>
<%
        }else if(alert.equals("editado")){//Caso de editar    
%>
<script>
    $(document).ready(function () {
        editado();
    });
</script>
<%
        }  else if(alert.equals("ingreso")){//Caso de ingresar de nuevo
                     
%>
<script>
    $(document).ready(function () {
        ingreso();
    });
</script>
<%
        }
    }
%>
  <main id="main" class="main">

    <div class="pagetitle">
        <h1><center>TUTORIALES</center></h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
          <li class="breadcrumb-item active">Tutoriales</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- formulario -->
            <div class="col-12">
              <div class="card">

                <div class="card-body">
                  <h5 class="card-title">Ingresa tu tutorial </h5>

                  <!-- Line Chart -->
                  <div id="reportsChart"></div>
                                  
                   <form class="row g-3 needs-validation"  action="SvGestiones" method="POST" novalidate>
                    <!-- Nombre -->
                    <div class="col-md-4">
                      <label for="validationCustom01" class="form-label">Nombre</label>
                      <input type="text" class="form-control" id="validationCustom01" name="nombre" required>
                      <div class="valid-feedback">
                        Se mira bien!
                      </div>
                      <div class="invalid-feedback">
                          Ingresa algo valido.
                        </div>
                    </div>
                    <!-- Prioridad -->
                    <div class="col-md-4">
                        <label for="validationCustomUsername" class="form-label">Prioridad</label>
                        <select class="form-select" id="validationCustomUsername" name="prioridad" required>
                            <option selected disabled value="">Selecciona una prioridad</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                        <div class="valid-feedback">
                            ¡Se ve bien!
                        </div>
                        <div class="invalid-feedback">
                            Por favor, selecciona una prioridad válida.
                        </div>
                    </div>

                    <!-- Estado -->
                    <div class="col-md-4">
                        <label for="validationCustom05" class="form-label">Estado</label>
                        <select class="form-select" id="validationCustom05" name="estado" required>
                            <option selected disabled value="">Selecciona un estado</option>
                            <option value="Activo">Activo</option>
                            <option value="Inactivo">Inactivo</option>
                            <option value="Pendiente">Pendiente</option>
                        </select>
                        <div class="valid-feedback">
                            ¡Se ve bien!
                        </div>
                        <div class="invalid-feedback">
                            Por favor, selecciona un estado válido.
                        </div>
                    </div>

                    <!-- Categoria -->
                    <div class="col-md-6">
                      <label for="validationCustom04" class="form-label">Categoria</label>                     
                      <select class="form-select" id="validationCustom04" name="categoria" required>
                        <option selected disabled value="">Elige...</option>                       
                        <%
                        //Mostrar dinamicamente las categorias
                        Gestiones gestionar = new Gestiones();//Se crea objeto para usar los metodos
                        ArrayList<Categoria> result2 = gestionar.getCategorias();//Array para almacenar las categorias
                        // Iterar sobre los resultados y mostrarlos en la tabla
                        for (Categoria cat: result2) { //Se recorre el array mostrando cada opcion

                      %>
                        <option value="<%=cat.getId()%>"><%=cat.getCategoria()%></option>
                        <%}%>
                      </select>
                      <div class="valid-feedback">
                        Se mira bien!
                      </div>
                      <div class="invalid-feedback">
                        Ingresa algo valido.
                      </div>
                    </div>
                    <!-- URL -->
                     <div class="col-md-6">
                      <label for="validationCustom05" class="form-label">URL</label>
                      <input type="text" class="form-control" id="validationCustom05" name="url" required>
                      <div class="valid-feedback">
                        Se mira bien!
                      </div>
                      <div class="invalid-feedback">
                        Ingresa algo valido.
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                        <label class="form-check-label" for="invalidCheck">
                          Acepto los terminos y condiciones
                        </label>
                        <div class="invalid-feedback">
                          Debes aceptar.
                        </div>
                      </div>
                    </div>
                    <!-- Boton -->
                    <div class="col-12">
                        <center><button class="btn btn-outline-success" type="submit">Agregar</button></center>
                    </div>
                  </form>

                </div>

              </div>
            </div><!-- Fin Formulario -->

            <!-- Tabla tutoriales -->
            <div class="col-12">
            <div class="card recent-sales overflow-auto">


            <div class="card-body">
                <h5 class="card-title">Tutoriales <span>| Ingresados</span></h5>

                <table class="table table-striped table-hover datatable">
                   <thead>
                       <tr>
                           <th scope="col">ID</th>
                           <th scope="col">Nombre</th>
                           <th scope="col">Categoria</th>
                           <th scope="col">URL</th>
                           <th scope="col">Estado</th>
                           <th scope="col">Prioridad</th>
                           <th scope="col">Acciones</th>
                       </tr>
                   </thead>
                    <tbody>
                <% 
                    ArrayList<Tutorial> result = gestionar.getTutoriales();//Array que se llena con los tutoriales
                    // Iterar sobre los resultados y mostrarlos en la tabla
                    for (Tutorial tut: result) {
                %>
                        <tr>
                            <td><%= tut.getId() %></td>
                            <td><%= tut.getNombre() %></td>
                            <td><%= tut.getCategoria() %></td>
                            <td><a href="<%= tut.getUrl()%> " target="_blank">Enlace</a></td>
                            <td><%= tut.getEstado() %></td>
                            <td><%= tut.getPrioridad() %></td> <!-- cerrar la etiqueta <td> -->
                            <td>
                                <a href="#" type="button" class="btn btn-primary verButton" data-id="<%=tut.getId()%>" id="verButton" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-regular fa-eye"></i></a>
                                <a href="#" type="button" class="btn btn-warning" data-id="<%=tut.getId()%>" id="editarButton" data-bs-toggle="editar" data-bs-target="#editarModal"><i class="fa-solid fa-user-pen"></i></a>
                                <a class="btn btn-danger deleteButton" href="#" data-id="<%=tut.getId()%>" onclick="eliminarTutorial(<%=tut.getId()%>)">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            
            </div>  

            </div>
            </div><!-- Fin tabla tutoriales-->
          </div>
        </div><!-- End Left side columns -->
      </div>
    </section>


    <!-- Modal Ver -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
           <h1 class="modal-title fs-5" id="exampleModalLabel">Detalle Tutorial</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
                    <div id="ver-details">
                            <!-- Contenido dinámico: Aquí se mostrarán los detalles a ver -->
                    </div>
                </div>
          <div class="modal-footer">

          </div>
        </div>
      </div>
    </div>

    <!-- Modal Editar -->
    <div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
           <h1 class="modal-title fs-5" id="exampleModalLabel">Editar</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <form class="row g-3 needs-validation"  action="SvEditar" method="POST" novalidate>
                    <div id="editar-details">
                            <!-- Contenido dinámico: Aquí se mostrarán los detalles a editar -->
                    </div>
              </form>         
                </div>
          <div class="modal-footer">

          </div>
        </div>
      </div>
    </div>
  
</main><!-- End #main -->


 
  <script>
   /**
    * Funcion ver
    */
    $(document).ready(function () {
       // Al hacer clic en un elemento con el atributo data-bs-toggle="ver"
       $('[data-bs-toggle="modal"]').on('click', function () {
           // Obtener el id del tutorial desde el atributo data-id
           var id = $(this).data('id');
           // Realizar una solicitud AJAX para obtener detalles del tutorial por su id
           $.ajax({
               url: 'SvGestiones?id=' + id, // URL del servlet o recurso que maneja la solicitud
               method: 'GET',
               success: function (data) {
                   // Éxito: Colocar los detalles del tutorial en el contenedor #tutorial-details
                   $('#ver-details').html(data);
                   // Mostrar el modal (exampleModal) una vez que se han cargado los detalles del tutorial
                   $('#exampleModal').modal('show');
               },
               error: function () {
                   console.log('Error al cargar los detalles del tutorial.');
               }
           });
       });
   });
   /**
    * Funcion editar
    */
 $(document).ready(function () {
    // Al hacer clic en un elemento con el atributo data-bs-toggle="editar"
    $('[data-bs-toggle="editar"]').on('click', function () {
        // Obtener el id del tutorial desde el atributo data-id
        var id = $(this).data('id');
        // Realizar una solicitud AJAX para obtener detalles del tutorial por su id
        $.ajax({
            url: 'SvEditar?id=' + id, // URL del servlet o recurso que maneja la solicitud
            method: 'GET',
            success: function (data) {
                // Éxito: Colocar los detalles del tutorial en el contenedor #tutorial-details
                $('#editar-details').html(data);
                // Mostrar el modal (exampleModal) una vez que se han cargado los detalles del tutorial
                $('#editarModal').modal('show');
            },
            error: function () {
                console.log('Error al cargar los detalles del tutorial.');
            }
        });
    });
});
    /**
    * Funcion eliminar
    */
function eliminarTutorial(id) {
  // Mostrar Sweet Alert para confirmar la eliminación
  Swal.fire({
    title: '¿Estás seguro?',
    text: '¡No podrás revertir esto!',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Sí, borrarlo',
    cancelButtonText: 'No, cancelar',
    reverseButtons: true
  }).then((result) => {
    if (result.isConfirmed) {
      // Enviar solicitud al servidor para eliminar el registro con el ID especificado
      $.ajax({
        url: 'SvEliminar', // Solicitud al servlet por metodo POST
        type: 'POST',
        data: { id: id },
        success: function(response) {
          // Manejar la respuesta del servidor (por ejemplo, recargar la página)
          // Aquí puedes agregar cualquier otra acción necesaria
          // Mostrar Sweet Alert de éxito
          Swal.fire(
            '¡Eliminado!',
            'El tutorial ha sido eliminado.',
            'success'
          ).then((result) => {
            // Recargar la página o actualizar la tabla de tutoriales
            location.reload(); // Recargar la página
          });
        },
        error: function(xhr, status, error) {
          // Manejar cualquier error de la solicitud AJAX
          console.error('Error al eliminar el tutorial:', error);
          Swal.fire(
            'Error',
            'Hubo un error al intentar eliminar el tutorial.',
            'error'
          );
        }
      });
    } else{
       Swal.fire(
        'Cancelado',
        'Tu tutorial imaginario está a salvo :)',
        'error'
        );

    }
  });
}


    /**
     * FUNCIONES SWEET ALERT
     * @returns {undefined}
     */
            function anadido() {
                // Utiliza la librería Swal para mostrar una notificación de éxito
                Swal.fire({
                    icon: 'success', // Icono de éxito
                    title: 'Añadido exitosamente!', // Título de la notificación
                    text: '¡Puedes verlo en la tabla!', // Texto de la notificación
                    showConfirmButton: false, // No muestra el botón de confirmación
                    timer: 1500 // Tiempo de duración de la notificación (en milisegundos)
                })
            }
            function editado() {
               Swal.fire({
                    icon: 'warning', // Icono de éxito
                    title: 'Editado exitosamente!', // Título de la notificación
                    text: '¡Revisalo en la tabla!', // Texto de la notificación
                    showConfirmButton: false, // No muestra el botón de confirmación
                    timer: 1500 // Tiempo de duración de la notificación (en milisegundos)
                })
            }
      
  </script>
    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">
      <div class="copyright">
        &copy; Copyright <strong><span>NiceTutorial</span></strong>. Todos los derechos reservados
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </footer><!-- End Footer -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/chart.js/chart.umd.js"></script>
    <script src="assets/vendor/echarts/echarts.min.js"></script>
    <script src="assets/vendor/quill/quill.min.js"></script>
    <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

</body>

</html>