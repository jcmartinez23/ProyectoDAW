<%@page import="java.util.List"%>
<%@page import="org.jcmg.hibernate.entities.User"%>
<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title">
            Empresas <small>listado y creación</small>
        </h3>
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="Controller">
                    Home
                </a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">
                    Empresas
                </a>
            </li>
        </ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-6 ">
        <!-- BEGIN SAMPLE FORM PORTLET-->
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i> Insertar Empresa
                </div>                
            </div>
            <div class="portlet-body form" style="display: block;">
                <form role="form" method="POST" action="Controller?action=AddUser">
                    <div class="form-body">
                        <div class="form-group">
                            <label for="inputCIF">CIF</label>
                            <input type="text" class="form-control" id="inputCIF" placeholder="S2426686H" name="cif">                            
                        </div>
                        <div class="form-group">
                            <label>Nombre</label>                                                            
                            <input type="text" class="form-control" placeholder="Empresa S.A" name="name">
                        </div>                        
                        <div class="form-group">
                            <label>Responsable</label>
                            <select class="form-control" name="teacher">
                                
                            </select>
                        </div>                        
                        <div class="form-group">
                            <label for="exampleInputFile1">Subir logo</label>
                            <input type="file" id="inputPhoto" name="logo">
                        </div>                        
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn blue">Crear</button>
                        <button type="button" class="btn default">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- END SAMPLE FORM PORTLET-->
    </div>
    <div class="col-md-6 ">
        <!-- BEGIN SAMPLE FORM PORTLET-->       
        <div class="portlet box green " style="overflow: hidden;">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i> Lista de Empresas
                </div>
            </div>
            <div class="portlet-body form">
            <%
                List<User> teachers = (List<User>) request.getAttribute("teachers");
                for(User teacher : teachers) {
            %>   
                <div class="row portfolio-block">
                    <div class="col-md-7">
                        <div class="portfolio-text">
                            <img src="<%=teacher.getAvatar()%>" alt="">
                            <div class="portfolio-text-info">
                                <h4><%=teacher.getFirstName()%></h4>
                                <p><%=teacher.getLastName()%></p>
                            </div>
                        </div>
                    </div>                    
                    <div class="col-md-3" style="float:right;">
                        <div class="portfolio-btn">
                            <a href="#" class="btn bigicn-only">
                                <span>
                                    Manage
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            <%}%>    
            </div>
        </div>
        <!-- END SAMPLE FORM PORTLET-->
    </div>
</div>