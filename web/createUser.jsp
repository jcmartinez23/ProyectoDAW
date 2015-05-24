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
                <form role="form" method="POST" action="Controller?action=AddUser">
                    <div class="form-body">
                        <div class="form-group">
                            <label for="mail">Correo</label>
                            <input type="text" class="form-control" id="mail" placeholder="manuel@mail.com" name="mail">                            
                        </div>
                        <div class="form-group">
                            <label for="inputName">Nombre</label>
                            <input type="text" class="form-control" id="inputName" placeholder="Manuel" name="firstName">                            
                        </div>
                        <div class="form-group">
                            <label for="lastName">Apellidos</label>                                                            
                            <input type="text" class="form-control" placeholder="Molina Jiménez" name="lastName">
                        </div>                        
                        <div class="form-group">
                            <label>Teléfono</label>
                            <input type="text" class="form-control" placeholder="666666666" name="phone">
                        </div>                        
                        <div class="form-group">
                            <label for="userType">Tipo de Usuario</label>
                            <select name="userType" id="userType">                                
                                <option value="C">Coordinador</option>
                                <option value="P">Profesor</option>                                
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