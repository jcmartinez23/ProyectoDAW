<%@page import="org.jcmg.hibernate.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="org.jcmg.hibernate.entities.Student"%>			
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title">
            Lista de Alumnos
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
                    Alumnos
                </a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">
                    Lista de alumnos
                </a>
            </li>
        </ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-lg-12">
        <!-- BEGIN SAMPLE TABLE PORTLET-->
        <div class="portlet">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-bell-o"></i>Alumnos
                </div>                
            </div>
            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-advance table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <i class="fa fa-user"></i> Alumno
                                </th>
                                <th>
                                    <i class="fa fa-envelope"></i> Mail
                                </th>
                                <th class="hidden-xs">
                                    <i class="fa fa-briefcase"></i> Grupo

                                </th>
                                <th>
                                    <i class="fa fa-shopping-cart"></i> Acción
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Student> students = (List<Student>) request.getSession().getAttribute("students");

                                for (Student student : students) {
                                    User user = student.getUser();
                            %>                            
                            <tr>
                                <td class="highlight">
                                    <div class="success">
                                    </div>
                                    <a href="#">
                                        <%=user.getFirstName()%>
                                        <%=user.getLastName()%>
                                    </a>
                                </td>
                                <td class="hidden-xs">
                                    <%=user.getMail()%>
                                </td>
                                <td>
                                    <% if (student.getGroup() != null) {%>                         
                                    <%=student.getGroup().getGroupCode()%>
                                    <% } else {%>
                                    <label style="color:red;">Sin Asignar</label>
                                    <% }%>
                                </td>
                                <td>
                                    <a href="#" class="btn default btn-xs purple">
                                        <i class="fa fa-edit"></i> Edit
                                    </a>
                                </td>
                            </tr>    
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- END SAMPLE TABLE PORTLET-->
    </div>            
</div>
<!-- END PAGE CONTENT-->
