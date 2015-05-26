<%@page import="org.jcmg.hibernate.entities.User"%>
<%@page import="org.jcmg.hibernate.entities.Message"%>
<%@page import="java.util.List"%>
<!-- END STYLE CUSTOMIZER -->
<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title">
            Mensajes <small>correo interno</small>
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
                    Mensajes
                </a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<div class="row inbox">
    <%
        List<Message> messages = (List<Message>) request.getSession().getAttribute("messages");
    %>
    <div class="col-md-2">
        <ul class="inbox-nav margin-bottom-10">
            <li class="compose-btn">
                <a href="Controller?action=NewMessage" data-title="Compose" class="btn green">
                    <i class="fa fa-edit"></i> Nuevo
                </a>
            </li>
            <li class="inbox">
                <a href="Controller?action=MyInbox" class="btn" data-title="Inbox">
                    Recibidos
                </a>
                <b></b>
            </li>
            <li class="sent active">
                <a class="btn" href="Controller?action=SentMessages" data-title="Sent">
                    Enviados
                </a>
                <b></b>
            </li>                        
        </ul>
    </div>
    <div class="col-md-10">
        <div class="inbox-header">
            <h1 class="pull-left">Enviados</h1>
        </div>
        <div class="inbox-content">
            <div class="inbox-content"><table class="table table-striped table-advance table-hover">
                    <thead>
                        <tr>
                            <th colspan="3">
                    <div class="checker"><span><input type="checkbox" class="mail-checkbox mail-group-checkbox"></span></div>                    
                    </th>
                    <th class="pagination-control" colspan="3">
                        <span class="pagination-info">
                            1-4 of <%=messages.size()%> </span>
                        <a class="btn btn-sm blue">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="btn btn-sm blue">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </th>
                    </tr>
                    </thead>
                    <tbody>
                        <% User user = (User) request.getSession().getAttribute("user");
                            for (Message message : messages) {
                        %>                        
                        <tr data-messageid="1">
                            <td class="inbox-small-cells message-body">
                                <div style="display:none" class="body-hidden">
                                    <%=message.getBody()%>
                                </div>
                            </td>
                            <td class="inbox-small-cells">
                                <i class="fa fa-envelope"></i>
                            </td>
                            <td class="view-message hidden-xs message-user">
                                <%=message.getUserByReciever().getFirstName()%>
                                <%=message.getUserByReciever().getLastName()%>
                            </td>
                            <td class="view-message message-title">
                                <%=message.getTitle()%>
                            </td>
                            <td class="view-message inbox-small-cells">
                                <a class="btn purple btnMessage" data-target="#full-width" data-toggle="modal">Ver</a>
                            </td>
                            <td class="view-message text-right message-date">
                                <%=message.getDate()%>
                            </td>

                        </tr>    
                        <%}%>                                             
                    </tbody>
                </table></div>
            <div id="full-width" class="modal container fade" tabindex="-1" aria-hidden="true" style="display: none; margin-top: -138.5px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">Mensaje</h4>
                </div>
                <div class="modal-body">
                    <h3 id="title-message">                        
                    </h3>
                    <p id="body-message">

                    </p>
                </div>
                <div class="modal-footer">
                    <div style="float:left;">
                        Enviado a <label id="author"></label> a las <label id="date-message"></label>.
                    </div>
                    <button type="button" data-dismiss="modal" class="btn btn-default">Close</button>                    
                </div>
            </div>
        </div>
    </div>
</div>