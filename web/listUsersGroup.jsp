<%@page import="org.jcmg.hibernate.entities.Group"%>
<%@page import="org.jcmg.hibernate.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="org.jcmg.hibernate.entities.Student"%>			
<div class="row">
    <% User loggedUser = (User) request.getSession().getAttribute("user"); %>
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title">
            Lista de Compañeros
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
                    <i class="fa fa-graduation-cap"></i>Alumnos
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
                                <th>
                                    <i class="fa fa-anchor"></i> Acción
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Student> students = (List<Student>) request.getSession().getAttribute("groupStudents");

                                for (Student student : students) {
                                    User user = student.getUser();
                                    if(user.getUserId() != loggedUser.getUserId()) {
                            %>                            
                            <tr>
                                <td class="highlight">
                                    <div class="success">
                                    </div>
                                    <a href="Controller?action=ShowUserProfile&userMail=<%=user.getMail()%>" class="student-fullName">
                                        <%=user.getFirstName()%>
                                        <%=user.getLastName()%>
                                    </a>
                                </td>
                                <td class="hidden-xs student-mail">
                                    <%=user.getMail()%>
                                </td>
                                <td>                                                         
                                    <a href="Controller?action=NewMessage&mail=<%=user.getMail()%>" class="btn default btn-xs blue edit-attendance">
                                        <i class="fa fa-envelope"></i> Correo
                                    </a>                                    
                                </td>
                            </tr>    
                            <%}}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>        
        <!-- END SAMPLE TABLE PORTLET-->
    </div>            
</div>
<!-- END PAGE CONTENT-->
