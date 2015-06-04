<%@page import="org.jcmg.hibernate.entities.User"%>
<% User user = (User) request.getSession().getAttribute("userProfile"); %>
<div class="row">
    <div class="col-md-12">        
        <h3 class="page-title">
            <%=user.getFirstName()%> <%=user.getLastName()%> <small>información de usuario</small>
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
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1_1">
                    <div class="row">
                        <div class="col-md-3">
                            <ul class="list-unstyled profile-nav">
                                <li>
                                    <% String image = user.getAvatar() != null ? user.getAvatar() : "profile.jpg";%>
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
            </div>
        </div>
    </div>
