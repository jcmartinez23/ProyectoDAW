<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="org.jcmg.hibernate.entities.NonAttendance"%>
<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title">
            Jose Luis Perales <small>asistencia</small>
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
                    Jose Luis Perales
                </a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">
                    Asistencia
                </a>
            </li>
        </ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-6">
        <!-- BEGIN SAMPLE TABLE PORTLET-->
        <div class="portlet">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-bell-o"></i>Asistencia
                </div>                
            </div>
            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-advance table-hover">
                        <thead>                            
                            <tr>
                                <th>
                                    <i class="fa fa-calendar"></i> Fecha
                                </th>
                                <th class="hidden-xs">
                                    <i class="fa fa-check-square-o"></i> Justificada
                                </th>                                
                                <th>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                List<NonAttendance> justified = (List<NonAttendance>) request.getAttribute("justifiedNonAttendances");
                                List<NonAttendance> notJustified = (List<NonAttendance>) request.getAttribute("notJustifiedNonAttendances");
                            %>
                            <% for(NonAttendance nonAttendance : notJustified) { %>
                            <tr>
                                <td class="highlight">
                                    <label style="display: none"><%=nonAttendance.getNonAttendanceId()%></label>
                                    <div class="warning">
                                    </div>
                                    <a href="#">
                                        <%=sdf.format(nonAttendance.getDate())%>
                                    </a>
                                </td>
                                <td class="hidden-xs">
                                    No
                                </td>
                                <td>
                                    <a href="#" class="btn default btn-xs green">
                                        <i class="fa fa-check-circle"></i> Justificar
                                    </a>
                                </td>
                            </tr>          
                            <%}%>
                            <% for(NonAttendance nonAttendance : justified) { %>
                            <tr>
                                <td class="highlight">
                                    <label style="display: none"><%=nonAttendance.getNonAttendanceId()%></label>
                                    <div class="success">
                                    </div>
                                    <a href="#">
                                        <%=sdf.format(nonAttendance.getDate())%>
                                    </a>
                                </td>
                                <td class="hidden-xs">
                                    Si
                                </td>
                                <td>
                                    
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
    <div class="col-md-6">
        <div class="portlet">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-frown-o"></i>Anotar Faltas
                </div>   
            </div>
            <div class="portlet-body">               
                
            </div>
        </div>
    </div>
</div>