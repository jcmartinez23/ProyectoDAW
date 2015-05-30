<%@page import="org.jcmg.hibernate.entities.Group"%>
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
    <%User loggedUser = (User) request.getSession().getAttribute("user");%>
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
                                    <a href="#" class="student-fullName">
                                        <%=user.getFirstName()%>
                                        <%=user.getLastName()%>
                                    </a>
                                </td>
                                <td class="hidden-xs student-mail">
                                    <%=user.getMail()%>
                                </td>
                                <td id="student-group">
                                    <% if (student.getGroup() != null) {%>                         
                                    <%=student.getGroup().getGroupCode()%>
                                    <% } else {%>
                                    <label style="color:red;">Sin Asignar</label>
                                    <% }%>
                                </td>
                                <td>                     
                                    <%if (loggedUser.getUserType() == 'C') { %>
                                    <a href="#" class="btn default btn-xs purple edit-student" data-target="#full-width" data-toggle="modal">
                                        <i class="fa fa-edit"></i> Cambiar Grupo
                                    </a>
                                    <% } else { %>
                                    <a href="Controller?action=StudentAssistance&studentid=<%=student.getUserId()%>" class="btn default btn-xs blue edit-attendance">
                                        <i class="fa fa-edit"></i> Asistencia
                                    </a>
                                    <% } %>
                                </td>
                            </tr>    
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="full-width" class="modal container fade" tabindex="-1" aria-hidden="true" style="display: none; margin-top: -138.5px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">Editar Alumno</h4>
            </div>
            <div class="modal-body">
                <h3 id="name-student">                              
                </h3>       
                <div class="form" style="display: block;">
                    <form role="form" method="POST" action="Controller?action=UpdateStudentGroup">
                        <div class="form-body">
                            <div class="form-group">
                                <label for="mail">Correo</label>
                                <input type="text" class="form-control" id="mail-student" placeholder="manuel@mail.com" name="mail" readonly>                            
                            </div>                                                          
                            <div class="form-group">                            
                                <label>Grupo</label>
                                <select class="form-control" name="group">                                    
                                    <% List<Group> groups = (List< Group>) request.getSession().getAttribute("groups");
                                        for (Group group : groups) {%>
                                    <option value="<%=group.getGroupId()%>"><%=group.getGroupCode()%></option>
                                    <%}%>
                                </select>
                            </div>          
                        </div>                    


                        <div class="modal-footer">                
                            <button type="submit" class="btn blue">Actualizar</button>
                            <button type="button" data-dismiss="modal" class="btn btn-default">Close</button>                    
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- END SAMPLE TABLE PORTLET-->
    </div>            
</div>
<!-- END PAGE CONTENT-->
