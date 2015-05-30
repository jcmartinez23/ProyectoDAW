<%-- 
    Document   : index
    Created on : May 13, 2015, 7:48:09 PM
    Author     : juanca
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="org.jcmg.hibernate.entities.Message"%>
<%@page import="java.util.List"%>
<%@page import="org.jcmg.hibernate.entities.User"%>
<%@page import="org.jcmg.java.interfaces.UserBLL"%>
<%@page import="org.jcmg.java.BLL.UserBLLImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8"/>
        <title>Learning</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <meta content="" name="description"/>
        <meta content="" name="author"/>
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
        <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" type="text/css"/>       
        <link href="assets/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"/>
        <!-- END PAGE LEVEL PLUGIN STYLES -->
        <!-- BEGIN THEME STYLES -->
        <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/pages/tasks.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
        <link href="assets/css/print.css" rel="stylesheet" type="text/css" media="print"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/pages/profile.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/pages/inbox.css" rel="stylesheet" type="text/css"/>
        <!-- END THEME STYLES -->
        <link rel="shortcut icon" href="favicon.ico"/>
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="page-header-fixed">
        <!-- BEGIN HEADER -->
        <div class="header navbar navbar-fixed-top">
            <!-- BEGIN TOP NAVIGATION BAR -->
            <div class="header-inner">
                <!-- BEGIN LOGO -->
                <a class="navbar-brand" href="index.html">
                    <img src="assets/img/logo.png" alt="logo" class="img-responsive"/>
                </a>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <img src="assets/img/menu-toggler.png" alt=""/>
                </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN TOP NAVIGATION MENU -->
                <ul class="nav navbar-nav pull-right">
                    <!-- BEGIN INBOX DROPDOWN -->
                    <%
                        List<Message> userMessages = (List<Message>) request.getSession().getAttribute("unreadMessages");
                    %>
                    <li class="dropdown" id="header_inbox_bar">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <i class="fa fa-envelope"></i>
                            <span class="badge">
                                <%=userMessages.size()%>
                            </span>
                        </a>                        
                        <ul class="dropdown-menu extended inbox">
                            <li>
                                <p>
                                    Tienes <%=userMessages.size()%> nuevos mensajes
                                </p>
                            </li>
                            <li>
                                <ul class="dropdown-menu-list scroller" style="height: 250px;">
                                    <%
                                        DateFormat df = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
                                        for (Message message : userMessages) {
                                    %>                                    
                                    <li>
                                        <a>
                                            <span class="photo">
                                                <img src="profileimg/<%=message.getUserBySender().getUserId()%>.jpg" alt=""/>
                                            </span>
                                            <span class="subject">                                    
                                                <span class="from">
                                                    <%=message.getUserBySender().getFirstName()%>
                                                </span>
                                                <span class="time">
                                                    <%=df.format(message.getDate())%>
                                                </span>
                                            </span>                                
                                            <span class="message">
                                                <%=message.getTitle()%>
                                            </span>
                                        </a>
                                    </li>
                                    <% } %>                                    
                                </ul>
                            </li>
                            <li class="external">
                                <a href="Controller?action=MyInbox">
                                    Ver todos los mensajes <i class="m-icon-swapright"></i>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END INBOX DROPDOWN -->                    
                    <!-- BEGIN USER LOGIN DROPDOWN -->
                    <%
                        User user = (User) request.getSession().getAttribute("user");
                    %>
                    <li class="dropdown user">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <% String image = user.getAvatar() != null ? user.getAvatar() : "profile.jpg";%>
                            <img src="profileimg/<%=user.getUserId()%>.jpg" style="width: 40px;" alt=""/>
                            <span class="username">
                                <%=user.getFirstName()%> <%=user.getLastName()%>
                            </span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="extra_profile.html">
                                    <i class="fa fa-user"></i> Mi Perfil
                                </a>
                            </li>
                            <li>
                                <a href="Controller?action=MyInbox">
                                    <i class="fa fa-envelope"></i> Mis mensajes
                                    <span class="badge badge-danger">
                                        <%=userMessages.size()%>
                                    </span>
                                </a>
                            </li>
                            <li class="divider">
                            </li>
                            <li>
                                <a href="javascript:;" id="trigger_fullscreen">
                                    <i class="fa fa-arrows"></i> Pantalla Completa
                                </a>
                            </li>
                            <li>
                                <a href="login.html">
                                    <i class="fa fa-key"></i> Salir
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                </ul>
                <!-- END TOP NAVIGATION MENU -->
            </div>
            <!-- END TOP NAVIGATION BAR -->
        </div>
        <!-- END HEADER -->
        <div class="clearfix">
        </div>
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->
            <div class="page-sidebar-wrapper">
                <div class="page-sidebar navbar-collapse collapse">
                    <!-- add "navbar-no-scroll" class to disable the scrolling of the sidebar menu -->
                    <!-- BEGIN SIDEBAR MENU -->
                    <ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">                        
                        <li class="start active ">
                            <a href="Controller">
                                <i class="fa fa-home"></i>
                                <span class="title">
                                    Mi Perfil
                                </span>
                                <span class="selected">
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="Controller?action=ListCompanies">
                                <i class="fa fa-shopping-cart"></i>
                                <span class="title">
                                    Empresas
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>                            
                        </li>
                        <li>
                            <a href="Controller?action=ListTeachers">
                                <i class="fa fa-gift"></i>
                                <span class="title">
                                    Profesores
                                </span>
                                <span class="arrow">
                                </span>
                            </a>                                                     
                        </li>
                        <li>
                            <a href="Controller?action=CreateUserForm">
                                <i class="fa fa-cogs"></i>
                                <span class="title">
                                    Crear Usuarios
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>                            
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-bookmark-o"></i>
                                <span class="title">
                                    Grupos
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="Controller?action=CreateGroupForm">
                                        Nuevo
                                    </a>
                                </li>
                                <li>
                                    <a href="ui_buttons.html">
                                        Gestionar
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-puzzle-piece"></i>
                                <span class="title">
                                    Alumnos
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="Controller?action=StudentList">
                                        Lista
                                    </a>
                                </li>        
                                <li>
                                    <a href="Controller?action=CreateStudent">
                                        Registar
                                    </a>
                                </li>                        
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-table"></i>
                                <span class="title">
                                    Form Stuff
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="form_controls.html">
                                        Form Controls
                                    </a>
                                </li>
                                <li>
                                    <a href="form_layouts.html">
                                        Form Layouts
                                    </a>
                                </li>
                                <li>
                                    <a href="form_editable.html">
                                        <span class="badge badge-roundless badge-warning">
                                            new
                                        </span>
                                        Form X-editable
                                    </a>
                                </li>
                                <li>
                                    <a href="form_wizard.html">
                                        Form Wizard
                                    </a>
                                </li>
                                <li>
                                    <a href="form_validation.html">
                                        Form Validation
                                    </a>
                                </li>
                                <li>
                                    <a href="form_image_crop.html">
                                        <span class="badge badge-roundless badge-important">
                                            new
                                        </span>
                                        Image Cropping
                                    </a>
                                </li>
                                <li>
                                    <a href="form_fileupload.html">
                                        Multiple File Upload
                                    </a>
                                </li>
                                <li>
                                    <a href="form_dropzone.html">
                                        Dropzone File Upload
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-envelope-o"></i>
                                <span class="title">
                                    Email Templates
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="email_newsletter.html">
                                        Responsive Newsletter<br>
                                        Email Template
                                    </a>
                                </li>
                                <li>
                                    <a href="email_system.html">
                                        Responsive System<br>
                                        Email Template
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-sitemap"></i>
                                <span class="title">
                                    Pages
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="page_portfolio.html">
                                        <i class="fa fa-briefcase"></i>
                                        <span class="badge badge-warning badge-roundless">
                                            new
                                        </span>
                                        Portfolio
                                    </a>
                                </li>
                                <li>
                                    <a href="page_timeline.html">
                                        <i class="fa fa-clock-o"></i>
                                        <span class="badge badge-info">
                                            4
                                        </span>
                                        Timeline
                                    </a>
                                </li>
                                <li>
                                    <a href="page_coming_soon.html">
                                        <i class="fa fa-cogs"></i>
                                        Coming Soon
                                    </a>
                                </li>
                                <li>
                                    <a href="page_blog.html">
                                        <i class="fa fa-comments"></i>
                                        Blog
                                    </a>
                                </li>
                                <li>
                                    <a href="page_blog_item.html">
                                        <i class="fa fa-font"></i>
                                        Blog Post
                                    </a>
                                </li>
                                <li>
                                    <a href="page_news.html">
                                        <i class="fa fa-coffee"></i>
                                        <span class="badge badge-success">
                                            9
                                        </span>
                                        News
                                    </a>
                                </li>
                                <li>
                                    <a href="page_news_item.html">
                                        <i class="fa fa-bell"></i>
                                        News View
                                    </a>
                                </li>
                                <li>
                                    <a href="page_about.html">
                                        <i class="fa fa-group"></i>
                                        About Us
                                    </a>
                                </li>
                                <li>
                                    <a href="page_contact.html">
                                        <i class="fa fa-envelope-o"></i>
                                        Contact Us
                                    </a>
                                </li>
                                <li>
                                    <a href="page_calendar.html">
                                        <i class="fa fa-calendar"></i>
                                        <span class="badge badge-important">
                                            14
                                        </span>
                                        Calendar
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-gift"></i>
                                <span class="title">
                                    Extra
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="extra_profile.html">
                                        User Profile
                                    </a>
                                </li>
                                <li>
                                    <a href="extra_lock.html">
                                        Lock Screen
                                    </a>
                                </li>
                                <li>
                                    <a href="extra_faq.html">
                                        FAQ
                                    </a>
                                </li>
                                <li>
                                    <a href="inbox.html">
                                        <span class="badge badge-important">
                                            4
                                        </span>
                                        Inbox
                                    </a>
                                </li>
                                <li>
                                    <a href="extra_search.html">
                                        Search Results
                                    </a>
                                </li>
                                <li>
                                    <a href="extra_invoice.html">
                                        Invoice
                                    </a>
                                </li>
                                <li>
                                    <a href="extra_pricing_table.html">
                                        Pricing Tables
                                    </a>
                                </li>
                                <li>
                                    <a href="extra_404_option1.html">
                                        404 Page Option 1
                                    </a>
                                </li>
                                <li>
                                    <a href="extra_404_option2.html">
                                        404 Page Option 2
                                    </a>
                                </li>
                                <li>
                                    <a href="extra_404_option3.html">
                                        404 Page Option 3
                                    </a>
                                </li>
                                <li>
                                    <a href="extra_500_option1.html">
                                        500 Page Option 1
                                    </a>
                                </li>
                                <li>
                                    <a href="extra_500_option2.html">
                                        500 Page Option 2
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-folder-open"></i>
                                <span class="title">
                                    Multi Level Menu
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="javascript:;">
                                        <i class="fa fa-cogs"></i> Item 1
                                        <span class="arrow">
                                        </span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="javascript:;">
                                                <i class="fa fa-user"></i>
                                                Sample Link 1
                                                <span class="arrow">
                                                </span>
                                            </a>
                                            <ul class="sub-menu">
                                                <li>
                                                    <a href="#">
                                                        <i class="fa fa-remove"></i> Sample Link 1
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <i class="fa fa-pencil"></i> Sample Link 1
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <i class="fa fa-edit"></i> Sample Link 1
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-user"></i> Sample Link 1
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-external-link"></i> Sample Link 2
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-bell"></i> Sample Link 3
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <i class="fa fa-globe"></i> Item 2
                                        <span class="arrow">
                                        </span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-user"></i> Sample Link 1
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-external-link"></i> Sample Link 1
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-bell"></i> Sample Link 1
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-folder-open"></i>
                                        Item 3
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-user"></i>
                                <span class="title">
                                    Login Options
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="login.html">
                                        Login Form 1
                                    </a>
                                </li>
                                <li>
                                    <a href="login_soft.html">
                                        Login Form 2
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-th"></i>
                                <span class="title">
                                    Data Tables
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="table_basic.html">
                                        Basic Datatables
                                    </a>
                                </li>
                                <li>
                                    <a href="table_responsive.html">
                                        Responsive Datatables
                                    </a>
                                </li>
                                <li>
                                    <a href="table_managed.html">
                                        Managed Datatables
                                    </a>
                                </li>
                                <li>
                                    <a href="table_editable.html">
                                        Editable Datatables
                                    </a>
                                </li>
                                <li>
                                    <a href="table_advanced.html">
                                        Advanced Datatables
                                    </a>
                                </li>
                                <li>
                                    <a href="table_ajax.html">
                                        Ajax Datatables
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-file-text"></i>
                                <span class="title">
                                    Portlets
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="portlet_general.html">
                                        General Portlets
                                    </a>
                                </li>
                                <li>
                                    <a href="portlet_ajax.html">
                                        Ajax Portlets
                                    </a>
                                </li>
                                <li>
                                    <a href="portlet_draggable.html">
                                        Draggable Portlets
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-map-marker"></i>
                                <span class="title">
                                    Maps
                                </span>
                                <span class="arrow ">
                                </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="maps_google.html">
                                        Google Maps
                                    </a>
                                </li>
                                <li>
                                    <a href="maps_vector.html">
                                        Vector Maps
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="last ">
                            <a href="charts.html">
                                <i class="fa fa-bar-chart-o"></i>
                                <span class="title">
                                    Visual Charts
                                </span>
                            </a>
                        </li>
                    </ul>
                    <!-- END SIDEBAR MENU -->
                </div>
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                    <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title">Modal title</h4>
                                </div>
                                <div class="modal-body">
                                    Widget settings form goes here
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn blue">Save changes</button>
                                    <button type="button" class="btn default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                    <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                    <!-- BEGIN PAGE HEADER-->            
                    <!-- END PAGE HEADER-->
                    <!-- BEGIN PAGE CONTENT-->
                    <%
                        String mainPage = (String) request.getAttribute("mainPage");
                    %>
                    <jsp:include page="<%=mainPage%>"></jsp:include>
                    <!-- END PAGE CONTENT-->
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END CONTAINER -->
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <div class="footer">
            <div class="footer-inner">
                2014 &copy; Metronic by keenthemes.
            </div>
            <div class="footer-tools">
                <span class="go-top">
                    <i class="fa fa-angle-up"></i>
                </span>
            </div>
        </div>
        <!-- END FOOTER -->
        <!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
        <!-- BEGIN CORE PLUGINS -->
        <!--[if lt IE 9]>
    <script src="assets/plugins/respond.min.js"></script>
    <script src="assets/plugins/excanvas.min.js"></script>
    <![endif]-->
        <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
        <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript" src="assets/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
        <script type="text/javascript" src="assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
        <script src="assets/plugins/jquery-validation/localization/messages_es.js" type="text/javascript"></script>
        <script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>      
        <script src="assets/scripts/custom/inbox_custom.js" type="text/javascript"></script>
        <script src="assets/scripts/custom/student-list.js" type="text/javascript"></script>
        <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.es.js"></script>        
        <script src="assets/scripts/custom/components-pickers.js"></script>        
        <script src="assets/scripts/core/app.js"></script>        
        <script src="assets/scripts/custom/form-validation.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                // initiate layout and plugins
                App.init();
                ComponentsPickers.init();
                FormValidation.init();
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>
