<%@page import="java.text.DateFormat"%>
<%@page import="org.jcmg.hibernate.entities.Message"%>
<%@page import="java.util.List"%>
<%@page import="org.jcmg.hibernate.entities.User"%>
<%@page import="org.jcmg.java.interfaces.UserBLL"%>
<%@page import="org.jcmg.java.BLL.UserBLLImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8"/>
        <title>Learning</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <meta content="" name="description"/>
        <meta content="Juan Carlos Martínez García" name="author"/>        
        
        <!-- PLUGIN STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>               
        <link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2.css">
        <link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2-metronic.css">
        <link rel="stylesheet" href="assets/plugins/data-tables/DT_bootstrap.css">
        <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" type="text/css"/>       
        <link href="assets/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>        
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
        <link rel="shortcut icon" href="favicon.ico"/>
    </head>    
    <body class="page-header-fixed">
        <div class="header navbar navbar-fixed-top">
            <div class="header-inner">
                <!-- BEGIN LOGO -->
                <a class="navbar-brand" href="Controller">
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
                                <a href="Controller">
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
            <% String menu = (String) request.getSession().getAttribute("menu");%>
            <jsp:include page="<%=menu%>"></jsp:include>
                <!-- END SIDEBAR -->                
                <div class="page-content-wrapper">
                    <div class="page-content">
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
                            </div>                            
                        </div>                        
                        <!-- BEGIN PAGE CONTENT-->
                    <%
                        String mainPage = (String) request.getAttribute("mainPage");
                    %>
                    <jsp:include page="<%=mainPage%>"></jsp:include>
                    <!-- END PAGE CONTENT-->
                </div>
            </div>            
        </div>        
        <!-- BEGIN FOOTER -->
        <div class="footer">
            <div class="footer-inner">
                2015 &copy; Proyecto final DAW. Juan Carlos Martínez García
            </div>
            <div class="footer-tools">
                <span class="go-top">
                    <i class="fa fa-angle-up"></i>
                </span>
            </div>
        </div>
        <!-- JAVASCRIPT PLUGINS -->
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
        <script type="text/javascript" src="assets/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script>                
        <script type="text/javascript" src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
        <script type="text/javascript" src="assets/plugins/jquery-validation/dist/additional-methods.js"></script>
        <script src="assets/plugins/jquery-validation/localization/messages_es.js" type="text/javascript"></script>
        <script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>      
        <script type="text/javascript" src="assets/plugins/data-tables/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="assets/plugins/data-tables/DT_bootstrap.js"></script>
        <script src="assets/scripts/custom/inbox_custom.js" type="text/javascript"></script>
        <script src="assets/scripts/custom/student-list.js" type="text/javascript"></script>
        <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.es.js"></script>        
        
        <!-- CUSTOM JS -->
        <script src="assets/scripts/custom/components-pickers.js"></script>        
        <script src="assets/scripts/core/app.js"></script>        
        <script src="assets/scripts/custom/form-validation.js"></script>                
        <script>
            jQuery(document).ready(function () {
                // initiate layout and plugins
                App.init();
                ComponentsPickers.init();
                FormValidation.init();
            });
        </script>        
    </body>
</html>
