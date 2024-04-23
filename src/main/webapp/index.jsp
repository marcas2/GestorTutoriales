
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
    if (alert != null) {//Prevenir errores
        if (alert.equals("anadido")) { //Caso de añadido exitoso

%>
<script>
    $(document).ready(function () {
        anadido();
    });
</script>
<%} else if (alert.equals("anadida")) {
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


<main id="main" class="main">

    <div class="pagetitle">
        <center><h1>BIENVENIDO</h1>
            <h4>Conoce nuestra pagina</h4>
        </center>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">
            <!-- Left side columns -->
            <div class="col-lg-8">
                <div class="row">

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>

                            </div>

                            <div class="card-body">
                                <h5 class="card-title"></span></h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-bookmark"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>Aprende </h6>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>

                            </div>

                            <div class="card-body">
                                <h5 class="card-title"></span></h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-arrows-move"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>Añade </h6>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>

                            </div>

                            <div class="card-body">
                                <h5 class="card-title"></span></h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-book"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>Revisa </h6>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Sales Card -->
                </div>
            </div><!-- End Left side columns -->

            <!-- Right side columns -->
            <div class="col-lg-4">

                <!-- Recent Activity -->
                <div class="card">
                    <div class="filter">
                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                            <li class="dropdown-header text-start">
                                <h6>Filter</h6>
                            </li>

                            <li><a class="dropdown-item" href="#">Today</a></li>
                            <li><a class="dropdown-item" href="#">This Month</a></li>
                            <li><a class="dropdown-item" href="#">This Year</a></li>
                        </ul>
                    </div>

                    <div class="card-body">
                        <h5 class="card-title">Actualizaciones <span>| Today</span></h5>

                        <div class="activity">

                            <div class="activity-item d-flex">
                                <div class="activite-label">32 min</div>
                                <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                                <div class="activity-content">
                                    Correccion errores
                                </div>
                            </div><!-- End activity item-->

                            <div class="activity-item d-flex">
                                <div class="activite-label">56 min</div>
                                <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                                <div class="activity-content">
                                    Añadir tablas
                                </div>
                            </div><!-- End activity item-->

                        </div>

                    </div>
                </div><!-- End Recent Activity -->

            </div><!-- End Right side columns -->
                        <div >
                <div class="card recent-sales overflow-auto">
                    <div class="card-body">
                        <h5 class="card-title"> <span></span></h5>

                        <div>
                            <div class="d-flex align-items-center justify-content-between">
                                <a href="index.html" class="logo d-flex align-items-center">
                                    <img src="assets/img/logo.png" alt="">
                                    <span class="d-none d-lg-block">NiceTutorial</span>
                                </a>
                            </div><!-- End Logo -->
                            <br>

                            <h5>Pagina de gestion de tutoriales. Descubre nuestras funcionalidades, agrega un tutorial y gestionalo,
                                descubre fuciones como: eliminar, ver  editar. Puedes gestionar tanto los tutoriales como las categorias 
                                de los mismos.</h5>
                            <center><img src="https://www.ispring.es/blog/wp-content/uploads/editor/2023/08/ispring-blog-image-1693298340.png" width="40%"></center>
                            <p>30 min. ago</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>

</main><!-- End #main -->

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
    // Definición de la función 'añadido()' en categorias
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