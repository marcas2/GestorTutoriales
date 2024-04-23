
<%@page import="Clases.Categoria"%>
<%@include file= "templates/header.jsp" %>
<%@include file= "templates/lateral.jsp" %>
<!-- Scripts necesarios (jQuery) -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<!-- Librerias sweet alert/ Toastr / Bootstrap-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<%
    //Alertas
    String alert = request.getParameter("alert"); //Recibe alerta para sweet alert o toastr
    System.out.println(alert);
    if (alert != null) {//Prevenir errores
        if (alert.equals("anadido")) { //Caso de añadido exitoso
%>
<script>
    $(document).ready(function () {
        anadido();
    });
</script>
<%
} else if (alert.equals("editado")) {//Caso de editar    
%>
<script>
    $(document).ready(function () {
        editado();
    });
</script>
<%
} else if (alert.equals("ingreso")) {//Caso de ingresar de nuevo

%>
<script>
    $(document).ready(function () {
        ingreso();
    });
</script>
<%} 
    }
%>
<main id="main" class="main">

    <div class="pagetitle">
        <h1><center>CATEGORIAS</center></h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                <li class="breadcrumb-item active">Categorias</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">

            <!-- Left side columns -->
            <div class="col-lg-8">
                <div class="row">

                    <!-- FORMULARIO -->
                    <div class="col-12">
                        <div class="card">

                            <div class="card-body">
                                <h5 class="card-title">Ingresa tu categoria </h5>

                                <!-- Line Chart -->
                                <div id="reportsChart"></div>


                                <form class="row g-3 needs-validation"  action="SvVerAgregarCategoria" method="POST" novalidate>
                                    <div >
                                        <label for="validationCustom01" class="form-label">Categoria</label>
                                        <input type="text" class="form-control" id="validationCustom01" name="categoria" required>
                                        <div class="valid-feedback">
                                            Se mira bien!
                                        </div>
                                        <div class="invalid-feedback">
                                            Ingresa algo valido.
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <center><button class="btn btn-outline-success" type="submit">Agregar</button></center>
                                    </div>
                                </form>

                            </div>

                        </div>
                    </div><!-- Fin formulario -->

                    <!-- Tabla -->
                    <div class="col-12">
                        <div class="card recent-sales overflow-auto">


                            <div class="card-body">
                                <h5 class="card-title">Categorias <span>| Ingresadas</span></h5>

                                <table class="table table-striped table-hover datatable">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Categoria</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  //Contenido dinamico
                                            Gestiones gestionar = new Gestiones();
                                            ArrayList<Categoria> result = gestionar.getCategorias();
                                            // Iterar sobre los resultados y mostrarlos en la tabla
                                            for (Categoria cat : result) {
                                        %>
                                        <tr>
                                            <td><%= cat.getId()%></td>
                                            <td><%= cat.getCategoria()%></td><!-- cerrar la etiqueta <td> -->
                                            <td>
                                                <a href="#" type="button" class="btn btn-primary verButton" data-id="<%=cat.getId()%>" id="verButton" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-regular fa-eye"></i></a>
                                                <a href="#" type="button" class="btn btn-warning" data-id="<%=cat.getId()%>" id="editarButton" data-bs-toggle="editar" data-bs-target="#editarModal"><i class="fa-solid fa-user-pen"></i></a>
                                                <a class="btn btn-danger deleteButton" href="#" data-id="<%=cat.getId()%>" onclick="eliminarTutorial(<%=cat.getId()%>)" ><i class="fas fa-trash"></i></a>
                                            </td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>


                            </div>  


                        </div>
                    </div><!-- End Recent Sales -->

                </div>
            </div><!-- End Left side columns -->

        </div>
    </section>


    <!-- Modal Ver -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Detalle Categoria</h1>
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
                    <form class="row g-3 needs-validation"  action="SvEditarCategoria" method="POST" novalidate>
                        <div id="editar-details">
                            <!-- Contenido dinámico: Aquí se mostrarán los detalles a ver -->
                        </div>
                    </form>         
                </div>
                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div>

</main><!-- End #main -->
<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

<!-- Scripts necesarios (jQuery) -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<!-- Librerias sweet alert/ Toastr / Bootstrap-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> 

<script>

                  $(document).ready(function () {
                      // Al hacer clic en un elemento con el atributo data-bs-toggle="ver"
                      $('[data-bs-toggle="modal"]').on('click', function () {
                          // Obtener el id del tutorial desde el atributo data-id
                          var id = $(this).data('id');
                          // Realizar una solicitud AJAX para obtener detalles del tutorial por su id
                          $.ajax({
                              url: 'SvVerAgregarCategoria?id=' + id, // URL del servlet o recurso que maneja la solicitud
                              method: 'GET',
                              success: function (data) {
                                  // Éxito: Colocar los detalles del tutorial en el contenedor #tutorial-details
                                  $('#ver-details').html(data);
                                  // Mostrar el modal (exampleModal) una vez que se han cargado los detalles del contacto
                                  $('#exampleModal').modal('show');
                              },
                              error: function () {
                                  console.log('Error al cargar los detalles del tutorial.');
                              }
                          });
                      });
                  });

                  $(document).ready(function () {
                      // Al hacer clic en un elemento con el atributo data-bs-toggle="ver"
                      $('[data-bs-toggle="editar"]').on('click', function () {
                          // Obtener el id del tutorial desde el atributo data-id
                          var id = $(this).data('id');
                          // Realizar una solicitud AJAX para obtener detalles del tutorial por su id
                          $.ajax({
                              url: 'SvEditarCategoria?id=' + id, // URL del servlet o recurso que maneja la solicitud
                              method: 'GET',
                              success: function (data) {
                                  // Éxito: Colocar los detalles del tutorial en el contenedor #tutorial-details
                                  $('#editar-details').html(data);
                                  // Mostrar el modal (exampleModal) una vez que se han cargado los detalles del contacto
                                  $('#editarModal').modal('show');
                              },
                              error: function () {
                                  console.log('Error al cargar los detalles del contacto.');
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
                                  url: 'SvEliminarCategoria', // Solicitud al servlet por metodo POST
                                  type: 'POST',
                                  data: {id: id},
                                  success: function (response) {
                                      // Manejar la respuesta del servidor (por ejemplo, recargar la página)
                                      // Aquí puedes agregar cualquier otra acción necesaria
                                      // Mostrar Sweet Alert de éxito
                                      Swal.fire(
                                              '¡Eliminado!',
                                              'La categoria ha sido eliminada.',
                                              'success'
                                              ).then((result) => {
                                          // Recargar la página o actualizar la tabla de tutoriales
                                          location.reload(); // Recargar la página
                                      });
                                  },
                                  error: function (xhr, status, error) {
                                      // Manejar cualquier error de la solicitud AJAX
                                      console.error('Error al eliminar la categoria:', error);
                                      Swal.fire(
                                              'Error',
                                              'Hubo un error al intentar eliminar la categoria.',
                                              'error'
                                              );
                                  }
                              });
                          } else {
                              Swal.fire(
                                      'Cancelado',
                                      'Tu categoria imaginaria está a salvo :)',
                                      'error'
                                      );

                          }
                      });
                  }

                  // Definición de la función 'añadido()'
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
                  function eliminado() {
                      Swal.fire({
                          icon: 'success', // Icono de éxito
                          title: 'Eliminado exitosamente!', // Título de la notificación
                          text: '¡Puedes verlo en la tabla!', // Texto de la notificación
                          showConfirmButton: false, // Nos muestra el botón de confirmación
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
