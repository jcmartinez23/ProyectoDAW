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
            NOMBREMPRESA <small>informe de asistencia, para mas información
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
                    EMPRESA
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
                    <i class="fa fa-globe"></i> Asistencia
                </div>        
                <div class="actions">
                    <div class="btn-group">
                        <select class="form-control input-small">
                            <option>Selecciona</option>
                            <% List<Object[]> months = (List<Object[]>) request.getSession().getAttribute("months");
                                for (Object[] month : months) { %>
                                <option value="<%=month[0] + "/" + month[1]%>"><%=month[0] + "/" + month[1]%></option>                            
                            <%}%>
                        </select>
                    </div>                                                
                        <a href="GetAssistanceDateRangeAJAX?month=05/2015">Test</a>
                </div>
            </div>
            <div class="portlet-body">
                <table class="table table-striped table-bordered table-hover table-full-width dataTable" id="sample_2" aria-describedby="sample_2_info" style="width: 1065px;">
                    <thead>
                        <tr role="row">
                            <th style="width: 168px;">Correo</th>
                            <th style="width: 168px;">Nombre</th>
                            <th style="width: 168px;">Grupo</th>
                            <th style="width: 168px;">No Justificadas</th>
                            <th style="width: 168px;">Justificadas</th>
                            <th style="width: 168px;">Totales</th>                            
                        </tr>
                    </thead>
                    <tbody role="alert" aria-live="polite" aria-relevant="all">                        
                        <tr>
                            <td class=" ">
                                asdas@mail.com
                            </td><td class=" sorting_1">
                                Luis
                                Perel
                            </td>
                            <td class=" ">
                                ING02
                            </td>                            
                            <td class=" ">
                                0
                            </td>
                            <td class=" ">
                                0
                            </td>
                            <td class=" ">
                                0
                            </td>                            
                        </tr>                                 
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-md-5 col-sm-12">
                        <div class="dataTables_info" id="sample_2_info">Showing 1 to 20 of 43 entries</div>                        
                    </div>
                    <div class="col-md-7 col-sm-12">
                        <div class="dataTables_paginate paging_bootstrap">
                            <ul class="pagination" style="visibility: visible;">
                                <li class="prev disabled">
                                    <a href="#" title="Previous">
                                        <i class="fa fa-angle-left"></i></a>
                                </li>
                                <li class="active">
                                    <a href="#">1</a>
                                </li>
                                <li>
                                    <a href="#">2</a>
                                </li>
                                <li>
                                    <a href="#">3</a>
                                </li>
                                <li class="next">
                                    <a href="#" title="Next">
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