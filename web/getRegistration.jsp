<%@page import="org.jcmg.hibernate.entities.Company"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="org.jcmg.hibernate.entities.NonAttendance"%>
<%@page import="java.util.HashSet"%>
<%@page import="org.jcmg.hibernate.entities.User"%>
<%@page import="org.jcmg.hibernate.entities.Student"%>
<%@page import="java.util.List"%>
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title">
            <% Company company = (Company) request.getSession().getAttribute("company"); %>
            <%=company.getName()%> <small>informe de matriculación</small>
        </h3>
        <ul class="page-breadcrumb breadcrumb">
            <li class="btn-group">
                <a href="RegistrationSheetGenerator" target="_blank">
                    <button type="button" class="btn blue">
                        <span>
                            Exportar a Excel
                        </span>                    
                    </button>                
                </a>
            </li>
            <li>
                <i class="fa fa-home"></i>
                <a href="index.html">
                    Home
                </a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">
                    <%=company.getName()%>
                </a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">
                    Informe de Matriculación
                </a>
            </li>
        </ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-globe"></i> Matriculaciones
                </div>               
            </div>
            <div class="portlet-body">
                <table class="table table-striped table-bordered table-hover table-full-width dataTable" id="sample_2" aria-describedby="sample_2_info" style="width: 1065px;">
                    <thead>
                        <tr role="row">
                            <th style="width: 198px;">Correo</th>
                            <th style="width: 198px;">Nombre</th>
                            <th style="width: 198px;">Grupo</th>                            
                        </tr>
                    </thead>
                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                        <% List<Student> students = (List<Student>) request.getSession().getAttribute("companyStudents");
                            for (Student student : students) {
                                User user = student.getUser();
                        %>
                        <tr>
                            <td class=" ">
                                <%=user.getMail()%>
                            </td><td class=" sorting_1">
                                <%=user.getFirstName()%>
                                <%=user.getLastName()%>
                            </td>
                            <td class=" ">
                                <%=student.getGroup() != null ? student.getGroup().getGroupCode() : "Sin asignar"%>
                            </td>                                                        
                        </tr>         
                        <%}%>
                    </tbody>
                </table>
                <div class="row">                    
                    <div class="col-md-7 col-sm-12">
                        <div class="dataTables_paginate paging_bootstrap">
                            <ul class="pagination" style="visibility: visible;">
                                <% int thisPage = (int)request.getAttribute("actualPage");%>                                
                                <% int maxPages = (int)request.getSession().getAttribute("maxPages");%>
                                <li class="prev <%=thisPage == 0?"hidden":""%>">
                                    <a href="Controller?action=GetRegistration&page=<%=thisPage - 1%>" title="Previous">
                                        <i class="fa fa-angle-left"></i></a>
                                </li>
                                <% for(int i = 0; i < maxPages + 1; i++) { %>
                                <li class="<%=i == thisPage?"active":""%>">
                                    <a href="Controller?action=GetRegistration&page=<%=i%>"><%=i+1%></a>
                                </li>                              
                                <%}%>
                                <li class="next <%=thisPage == maxPages?"hidden":""%>">
                                    <a href="Controller?action=GetRegistration&page=<%=thisPage + 1%>" title="Next">
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </div>
</div>
<!-- END EXAMPLE TABLE PORTLET-->