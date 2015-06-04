<div class="row">
    <div class="col-1">
        <!-- BEGIN SAMPLE FORM PORTLET-->
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i> Nuevo Mensaje
                </div>                
            </div>
            <div class="portlet-body form" style="display: block;">
                <form role="form" method="POST" action="Controller?action=SendMessage">
                    <div class="form-body">
                        <div class="form-group">     
                            <label>Destinaterio</label>
                            <div class="input-group">                                
                                <% String mailUser = (String) request.getAttribute("userToSend"); %>
                                <input type="text" class="form-control" placeholder="Correo destino" name="reciever" value="<%=mailUser == null || mailUser == ""? "":mailUser%>">                                
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName">Título</label>
                            <input type="text" class="form-control" id="title" placeholder="" name="title">                            
                        </div>
                        <div class="form-group">
                            <label>Cuerpo</label>                            
                            <textarea class="form-control" rows="5" name="body"></textarea>                            
                        </div>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn blue">Enviar</button>
                        <button type="button" class="btn default">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- END SAMPLE FORM PORTLET-->
    </div>
