<%@page import="org.jcmg.hibernate.entities.Company"%>
<%@page import="java.util.List"%>
<%@page import="org.jcmg.hibernate.entities.User"%>
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title">
            Grupos <small>creación</small>
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
                    Grupos
                </a>
            </li>
        </ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN SAMPLE FORM PORTLET-->
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i> Crear Grupo
                </div>                
            </div>
            <div class="portlet-body form" style="display: block;">
                <form id="form-newGroup" role="form" method="POST" action="Controller?action=AddGroup" novalidate="novalidate">
                    <div class="alert alert-danger display-hide">
                        <button class="close" data-close="alert"></button>
                        Faltan datos o hay datos erróneos! Comprueba el formulario.
                    </div>
                    <div class="form-body">
                        <div class="form-group">
                            <label for="code">Código</label>
                            <input type="text" class="form-control" id="code" placeholder="ING99" name="code">                            
                        </div>
                        <div class="form-group">
                            <label for="inputName">Horas Semanales</label>
                            <input type="number" class="form-control" id="hoursPerWeek" placeholder="0" name="hoursPerWeek">                            
                        </div>
                        <div class="form-group">
                            <label for="lastName">Profesor</label>                                                            
                            <select name="teacher" id="teacher">                                
                                <%
                                    List<User> teachers = (List<User>) request.getAttribute("teachers");
                                    for (User teacher : teachers) {
                                %>
                                <option value="<%=teacher.getUserId()%>">
                                    <%=teacher.getFirstName()%>  <%=teacher.getLastName()%>
                                </option>
                                <%}%>
                            </select>
                        </div>                                  
                        <div class="form-group">
                            <label for="company">Empresa</label>
                            <select name="company" id="company">                                
                                <%
                                    List<Company> companies = (List<Company>) request.getAttribute("companies");
                                    for (Company company : companies) {
                                %>
                                <option value="<%=company.getCif()%>">
                                    <%=company.getName()%>
                                </option>
                                <%}%>
                            </select>
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
</div>