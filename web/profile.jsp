<%@page import="org.jcmg.hibernate.entities.User"%>
<% User user = (User) request.getSession().getAttribute("user"); %>
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title">
            Mi perfil <small>información de usuario</small>
        </h3>
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="index.html">
                    Mi perfil
                </a>
            </li>
        </ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<div class="row profile">
    <div class="col-md-12">
        <!--BEGIN TABS-->
        <div class="tabbable tabbable-custom tabbable-full-width">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#tab_1_1" data-toggle="tab">
                        Perfil
                    </a>
                </li>
                <li>
                    <a href="#tab_1_3" data-toggle="tab">
                        Editar
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1_1">
                    <div class="row">
                        <div class="col-md-3">
                            <ul class="list-unstyled profile-nav">
                                <li>
                                    <img src="assets/img/profile/profile-img.png" class="img-responsive" alt=""/>
                                </li>
                                <!---------- Revisar esto por si hay que añadir funciones ---------------->
                                <li>
                                    <a href="#">
                                        Grupo
                                    </a>
                                </li>                                
                                <li>
                                    <a href="#">
                                        Mi coordinador
                                    </a>
                                </li>
                                <li>
                                    <%
                                        int unreadMessages = (int)request.getSession().getAttribute("countMessages");
                                    %>
                                    <a href="#">
                                        Mensajes
                                        <span>
                                            <%=unreadMessages%>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-md-8 profile-info">
                                    <h1><%=user.getFirstName()%></h1>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt laoreet dolore magna aliquam tincidunt erat volutpat laoreet dolore magna aliquam tincidunt erat volutpat.
                                    </p>
                                    <p>
                                        <a href="#">
                                            www.mywebsite.com
                                        </a>
                                    </p>
                                    <ul class="list-inline">
                                        <li>
                                            <i class="fa fa-map-marker"></i> LOCALIZACION
                                        </li>                                        
                                        <li>
                                            <i class="fa fa-briefcase"></i> EMPRESA
                                        </li>
                                        <li>
                                            <i class="fa fa-star"></i> <%=user.getJobPosition()%>
                                        </li>
                                        <li>
                                            <i class="fa fa-heart"></i> <%=user.getPastimes()%>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--end row-->
                            <div class="tabbable tabbable-custom tabbable-custom-profile">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#tab_1_22" data-toggle="tab">
                                            Feed
                                        </a>
                                    </li>                                    
                                </ul>
                                <div class="tab-content">
                                    <!--tab-pane-->
                                    <div class="tab-pane active" id="tab_1_22">
                                        <div class="tab-pane active" id="tab_1_1_1">
                                            <div class="scroller" data-height="290px" data-always-visible="1" data-rail-visible1="1">
                                                <ul class="feeds">
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-success">
                                                                        <i class="fa fa-bell-o"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        You have 4 pending tasks.
                                                                        <span class="label label-danger label-sm">
                                                                            Take action <i class="fa fa-share"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                Just now
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <div class="col1">
                                                                <div class="cont">
                                                                    <div class="cont-col1">
                                                                        <div class="label label-success">
                                                                            <i class="fa fa-bell-o"></i>
                                                                        </div>
                                                                    </div>
                                                                    <div class="cont-col2">
                                                                        <div class="desc">
                                                                            New version v1.4 just lunched!
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col2">
                                                                <div class="date">
                                                                    20 mins
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-danger">
                                                                        <i class="fa fa-bolt"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        Database server #12 overloaded. Please fix the issue.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                24 mins
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-info">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                30 mins
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-success">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                40 mins
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-warning">
                                                                        <i class="fa fa-plus"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New user registered.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                1.5 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-success">
                                                                        <i class="fa fa-bell-o"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        Web server hardware needs to be upgraded.
                                                                        <span class="label label-inverse label-sm">
                                                                            Overdue
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                2 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-default">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                3 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-warning">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                5 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-info">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                18 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-default">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                21 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-info">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                22 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-default">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                21 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-info">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                22 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-default">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                21 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-info">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                22 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-default">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                21 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col1">
                                                                    <div class="label label-info">
                                                                        <i class="fa fa-bullhorn"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="cont-col2">
                                                                    <div class="desc">
                                                                        New order received. Please take care of it.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">
                                                                22 hours
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!--tab-pane-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--tab_1_2-->
                <div class="tab-pane" id="tab_1_3">
                    <div class="row profile-account">
                        <div class="col-md-3">
                            <ul class="ver-inline-menu tabbable margin-bottom-10">
                                <li class="active">
                                    <a data-toggle="tab" href="#tab_1-1">
                                        <i class="fa fa-cog"></i> Información Personal
                                    </a>
                                    <span class="after">
                                    </span>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab_2-2">
                                        <i class="fa fa-picture-o"></i> Cambiar Avatar
                                    </a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab_3-3">
                                        <i class="fa fa-lock"></i> Cambiar Contraseña
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-9">
                            <div class="tab-content">
                                <div id="tab_1-1" class="tab-pane active">
                                    <form role="form" action="#">
                                        <div class="form-group">
                                            <label class="control-label">Localización</label>
                                            <input type="text" placeholder="Sagunto" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Nº de Telefono</label>
                                            <input type="text" placeholder="<%=user.getPhone()%>" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Intereses</label>
                                            <input type="text" placeholder="<%=user.getPastimes()%>" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Ocupación</label>
                                            <input type="text" placeholder="<%=user.getJobPosition()%>" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Sobre mí</label>
                                            <textarea class="form-control" rows="3" placeholder="Soy Guay!"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Web</label>
                                            <input type="text" placeholder="http://www.miweb.com" class="form-control"/>
                                        </div>
                                        <div class="margiv-top-10">
                                            <a href="#" class="btn green">
                                                Guardar Cambios
                                            </a>
                                            <a href="#" class="btn default">
                                                Cancelar
                                            </a>
                                        </div>
                                    </form>
                                </div>
                                <div id="tab_2-2" class="tab-pane">
                                    <p>
                                        Este es tu avatar. Es la imagen que verán el resto de usuarios cuando entren en tu perfil. Puedes subir cualquier imagen en formato JPG. Es aconsejable que la pongas, ya que los profesores te identificarán mas fácilmente gracias a ella.
                                    </p>
                                    <form action="#" role="form">
                                        <div class="form-group">
                                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt=""/>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
                                                </div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <!--<span class="fileinput-new">
                                                            Seleccionar
                                                        </span>
                                                        <span class="fileinput-exists">
                                                            Cambiar
                                                        </span> -->
                                                        <input type="file" name="...">
                                                    </span>
                                                    <a href="#" class="btn default fileinput-exists" data-dismiss="fileinput">
                                                        Eliminar
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="margin-top-10">
                                            <a href="#" class="btn green">
                                                Enviar
                                            </a>
                                            <a href="#" class="btn default">
                                                Cancelar
                                            </a>
                                        </div>
                                    </form>
                                </div>
                                <div id="tab_3-3" class="tab-pane">
                                    <form action="#">
                                        <div class="form-group">
                                            <label class="control-label">Contraseña actual</label>
                                            <input type="password" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Nueva contraseña</label>
                                            <input type="password" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Vuelve a escribir la nueva contraseña</label>
                                            <input type="password" class="form-control"/>
                                        </div>
                                        <div class="margin-top-10">
                                            <a href="#" class="btn green">
                                                Cambia la Contraseña
                                            </a>
                                            <a href="#" class="btn default">
                                                Cancelar
                                            </a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--end col-md-9-->
                    </div>
                </div>
            </div>
        </div>
        <!--END TABS-->
    </div>
