<%-- 
    Document   : index
    Created on : 16/04/2024, 5:56:33 p. m.
    Author     : maria
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Tutorial"%>
<%@page import="Clases.Gestiones"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Dashboard - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
  
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
      <script src="https://example.com/fontawesome/v6.5.2/js/fontawesome.js" data-auto-replace-svg="nest"></script>
 <script src="https://kit.fontawesome.com/ae360af17e.js" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Apr 7 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">NiceTutorial</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number">4</span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              You have 4 new notifications
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-exclamation-circle text-warning"></i>
              <div>
                <h4>Lorem Ipsum</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>30 min. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-x-circle text-danger"></i>
              <div>
                <h4>Atque rerum nesciunt</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>1 hr. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-check-circle text-success"></i>
              <div>
                <h4>Sit rerum fuga</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>2 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-info-circle text-primary"></i>
              <div>
                <h4>Dicta reprehenderit</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>4 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="#">Show all notifications</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-chat-left-text"></i>
            <span class="badge bg-success badge-number">3</span>
          </a><!-- End Messages Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
            <li class="dropdown-header">
              You have 3 new messages
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Maria Hudson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>4 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-2.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Anna Nelson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>6 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-3.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>David Muldon</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>8 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="dropdown-footer">
              <a href="#">Show all messages</a>
            </li>

          </ul><!-- End Messages Dropdown Items -->

        </li><!-- End Messages Nav -->
        
         <div class="col-12">
             <div class="card">
                 
             </div>
         </div> 
        
        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>Kevin Anderson</h6>
              <span>Web Designer</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="index.jsp">
          <i class="bi bi-grid"></i>
          <span>Tutoriales</span>
        </a>
      </li><!-- End Dashboard Nav -->

    </ul>

  </aside><!-- End Sidebar-->
  
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

            <!-- Reports -->
            <div class="col-12">
              <div class="card">

                <div class="card-body">
                  <h5 class="card-title">Ingresa tu tutorial </h5>

                  <!-- Line Chart -->
                  <div id="reportsChart"></div>
                  
                 
                   <form class="row g-3 needs-validation"  action="SvGestiones" method="POST" novalidate>
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
                    <div class="col-md-4">
                      <label for="validationCustomUsername" class="form-label">Prioridad</label>
                      <div class="input-group has-validation">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                        <input type="number" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" name="prioridad" required>
                        <div class="valid-feedback">
                        Se mira bien!
                        </div>
                        <div class="invalid-feedback">
                          Ingresa algo valido.
                        </div>
                      </div>
                    </div>
                       <div class="col-md-4">
                      <label for="validationCustom05" class="form-label">Estado</label>
                      <input type="text" class="form-control" id="validationCustom05" name="estado" required>
                      <div class="valid-feedback">
                        Se mira bien!
                      </div>
                      <div class="invalid-feedback">
                        Ingresa algo valido.
                      </div>
                    </div>
                    <div class="col-md-6">
                      <label for="validationCustom04" class="form-label">Categoria</label>
                      <select class="form-select" id="validationCustom04" name="categoria" required>
                        <option selected disabled value="">Elige...</option>
                        <option value="1">Logica de programacion</option>
                        <option value="2">Flutter</option>
                        <option value="3">Node.js</option>
                      </select>
                      <div class="valid-feedback">
                        Se mira bien!
                      </div>
                      <div class="invalid-feedback">
                        Ingresa algo valido.
                      </div>
                    </div>
                    
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
                    <div class="col-12">
                        <center><button class="btn btn-outline-success" type="submit">Agregar</button></center>
                    </div>
                  </form>

                </div>

              </div>
            </div><!-- End Reports -->

            <!-- Recent Sales -->
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
                            Gestiones gestionar = new Gestiones();
                            ArrayList<Tutorial> result = gestionar.getTutoriales();
                            // Iterar sobre los resultados y mostrarlos en la tabla
                            for (Tutorial tut: result) {
                        %>
                        <tr>
                            <td><%= tut.getId() %></td>
                            <td><%= tut.getNombre() %></td>
                            <td><%= tut.getCategoria() %></td>
                            <td><a href="<%= tut.getUrl()%> " target="_blank">Enlace</a></td>
                            <td><%= tut.getEstado() %></td>
                            <td><%= tut.getPrioridad()%><td>
                            <td><a href ="#" type="button" class="btn btn-primary verButton" data-id="<%=tut.getId()%>" id="verButton" data-bs-toggle="modal" data-bs-target="#exampleModal" ><i class="fa-regular fa-eye"></i></a>
                                <a href ="#" type="button" class="btn btn-warning" data-id="<%=tut.getId()%>" id="editarButton" data-bs-toggle="editar" data-bs-target="#editarModal" ><i class="fa-solid fa-user-pen"></i></a>

                                <a class="btn btn-danger" href="SvEliminar?id=<%=tut.getId()%>"><i class="fas fa-trash"></i></a>
                            <td>
                        </tr>
                        <% } %>
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
       <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
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
                <div id="editar-details">
                        <!-- Contenido dinámico: Aquí se mostrarán los detalles a ver -->
                </div>
                    
            </div>
      <div class="modal-footer">

      </div>
    </div>
  </div>
</div>
  
  </main><!-- End #main -->
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
            url: 'SvGestiones?id=' + id, // URL del servlet o recurso que maneja la solicitud
            method: 'GET',
            success: function (data) {
                // Éxito: Colocar los detalles del tutorial en el contenedor #tutorial-details
                $('#ver-details').html(data);
                // Mostrar el modal (exampleModal) una vez que se han cargado los detalles del contacto
                $('#exampleModal').modal('show');
            },
            error: function () {
                console.log('Error al cargar los detalles del contacto.');
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
            url: 'SvEditar?id=' + id, // URL del servlet o recurso que maneja la solicitud
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
