<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.jcmg.hibernate.entities.Company"%>
<%@page import="java.util.Date"%>
<%@page import="java.lang.String"%>
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
            <% Company company = (Company) request.getSession().getAttribute("company");%>
            <%=company.getName()%>  <small>informe de asistencia, para mas información
                descargar excel</small>                        
        </h3>
        <ul class="page-breadcrumb breadcrumb">
            <li class="btn-group">
                <a href="AttendanceSheetGenerator" target="_blank">
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
                    Informe de Asistencia
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
                    <i class="fa fa-globe"></i> Asistencia (Primeras 50)
                </div>        
            </div>
            <div class="portlet-body">
                <table class="table table-striped table-bordered table-hover table-full-width dataTable" id="sample_2" aria-describedby="sample_2_info" style="width: 1065px;">
                    <thead>
                        <tr role="row">
                            <th style="width: 168px;">Correo</th>
                            <th style="width: 168px;">Nombre</th>
                            <th style="width: 168px;">Grupo</th>
                            <th style="width: 168px;">Fecha</th>
                            <th style="width: 168px;">Justificada</th>                                                
                        </tr>
                    </thead>                             
                    <tbody role="alert" aria-live="polite" aria-relevant="all">                        
                        <% List<Student> students = (List<Student>) request.getSession().getAttribute("companyStudents");
                           SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                           int nonAttendanceCounter = 0;
                            for (Student student : students) {
                                Set nonAttendances = student.getNonAttendances();
                                Iterator nonAttIterator = nonAttendances.iterator();

                                while (nonAttIterator.hasNext() && nonAttendanceCounter < 50) {
                                    nonAttendanceCounter++;                                
                                    NonAttendance nonAttendance = (NonAttendance) nonAttIterator.next();
                        %>           
                        <tr>
                            <td class=" ">
                                <%=student.getUser().getMail()%>
                            </td><td class=" sorting_1">
                                <%=student.getUser().getFirstName()%>
                                <%=student.getUser().getLastName()%>
                            </td>
                            <td class=" ">
                                <%=student.getGroup().getGroupCode()%>
                            </td>                            
                            <td class=" ">
                                <%=sdf.format(nonAttendance.getDate())%>
                            </td>       
                            <td class=" ">
                                <%=nonAttendance.isProof()?"Si":"No"%>
                            </td>                                            
                        </tr>           
                        <%}
                            }%>
                    </tbody>
                </table>                
            </div>            
        </div>
    </div>
</div>
<!-- END EXAMPLE TABLE PORTLET-->