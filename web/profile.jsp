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
                <a href="Controller">
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
                                    <% String image = user.getAvatar() != null ? user.getAvatar() : "profile";%>
                                    <img src="profileimg/<%=image%>.jpg" class="img-responsive" alt=""/>
                                </li>                                                                
                            </ul>
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-md-8 profile-info">
                                    <h1><%=user.getFirstName()%> <%=user.getLastName()%></h1>
                                    <p>                                        
                                        <%=user.getAboutMe() != null && user.getAboutMe() != "" ? user.getAboutMe() : "Esto está un poco vacío, rellena tu perfil!"%>
                                    </p>                                    
                                    <ul class="list-inline">
                                        <li>
                                            <i class="fa fa-map-marker"></i> <%=user.getLocation() != null && user.getLocation() != "" ? user.getLocation() : "Sin Especificar"%>
                                        </li>                                                                                
                                        <li>
                                            <i class="fa fa-star"></i> <%=user.getJobPosition() != null && user.getJobPosition() != "" ? user.getJobPosition() : "Sin Especificar"%>
                                        </li>
                                        <li>
                                            <i class="fa fa-heart"></i> <%=user.getPastimes() != null && user.getPastimes() != "" ? user.getPastimes() : "Sin Especificar"%>
                                        </li>
                                        <li>
                                            <i class="fa fa-phone"></i> <%=user.getPhone()%>
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
                                <!--
                                <li>
                                    <a data-toggle="tab" href="#tab_2-2">
                                        <i class="fa fa-picture-o"></i> Cambiar Avatar
                                    </a>
                                </li>
                                -->
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
                                    <form role="form" action="Controller?action=UpdateUser" method="POST">
                                        <div class="form-group">
                                            <label class="control-label">Localización</label>
                                            <input name="localization" type="text" value="<%=user.getLocation() != null && user.getLocation() != "" ? user.getLocation() : "Sin especificar"%>" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Nº de Telefono</label>
                                            <input name="phoneNumber" type="text" value="<%=user.getPhone()%>" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Intereses</label>
                                            <input name="pastimes" type="text" value="<%=user.getPastimes() != null && user.getPastimes() != "" ? user.getPastimes() : "Sin especificar"%>" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Ocupación</label>
                                            <input name="jobPosition" type="text" value="<%=user.getJobPosition() != null && user.getJobPosition() != "" ? user.getJobPosition() : "Sin especificar"%>" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Sobre mí</label>
                                            <textarea name="aboutMe" class="form-control" rows="3" ><%=user.getAboutMe() != null && user.getAboutMe() != "" ? user.getAboutMe() : "Sin especificar"%></textarea>
                                        </div>                                        
                                        <div class="margiv-top-10">
                                            <button type="submit" class="btn green">
                                                Guardar Cambios
                                            </button>
                                            <a href="Controller" class="btn default">
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
                                                    <img src="<%=getServletContext().getContextPath()%>/profileimg/<%=image%>.jpg" class="img-responsive" alt=""/>
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
                                    <form action="Controller?action=ChangePassword" method="POST" id="form-password" novalidate="novalidate">
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            Faltan datos! Comprueba el formulario.
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Contraseña actual</label>
                                            <label id="passwordHidden" style="display:none;"><%=user.getPassword()%></label>
                                            <input id="oldPassword" name="oldPassword" type="password" class="form-control" required/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Nueva contraseña</label>
                                            <input id="newPassword" name="newPassword" type="password" class="form-control"required/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Vuelve a escribir la nueva contraseña</label>
                                            <input id="newPasswordRepeat" name="newPasswordRepeat" type="password" class="form-control" required/>
                                        </div>
                                        <div class="margin-top-10">
                                            <button type="submit" class="btn green">
                                                Cambia la Contraseña
                                            </button>
                                            <a href="Controller" class="btn default">
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
