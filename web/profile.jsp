<%@page import="org.jcmg.hibernate.entities.User"%>
<% User user = (User) request.getSession().getAttribute("user"); %>
<div class="row">
    <div class="col-md-12">        
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
                                    <% String image = user.getAvatar() != null ? user.getAvatar(): "profile.jpg";%>
                                    <img src="profileimg/<%=user.getUserId()%>.jpg" class="img-responsive" alt=""/>
                                </li>                                                                
                            </ul>
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-md-8 profile-info">
                                    <h1><%=user.getFirstName()%> <%=user.getLastName()%></h1>
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
                                            <i class="fa fa-star"></i> <%=user.getJobPosition()%>
                                        </li>
                                        <li>
                                            <i class="fa fa-heart"></i> <%=user.getPastimes()%>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--end row-->                            
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
                                    <form action="Controller?action=UploadFile" method="POST" role="form" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <img src="profileimg/<%=user.getUserId()%>.jpg" class="img-responsive" alt=""/>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
                                                </div>
                                                <div>
                                                    <span class="btn default btn-file">                                                        
                                                        <input type="file" name="...">
                                                    </span>
                                                    <a href="#" class="btn default fileinput-exists" data-dismiss="fileinput">
                                                        Eliminar
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="margin-top-10">
                                            <input type="submit" class="btn green" value="Enviar">                                                
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
                    </div>
                </div>
            </div>
        </div>
    </div>
