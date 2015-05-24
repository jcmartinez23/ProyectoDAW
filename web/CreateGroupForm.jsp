<%@page import="org.jcmg.hibernate.entities.Company"%>
<%@page import="java.util.List"%>
<%@page import="org.jcmg.hibernate.entities.User"%>
<div class="row">
    <div class="col-1">
        <!-- BEGIN SAMPLE FORM PORTLET-->
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i> Crear Usuario
                </div>                
            </div>
            <div class="portlet-body form" style="display: block;">
                <form role="form" method="POST" action="Controller?action=AddGroup">
                    <div class="form-body">
                        <div class="form-group">
                            <label for="code">C�digo</label>
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