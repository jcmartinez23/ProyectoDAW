<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">
        <!-- add "navbar-no-scroll" class to disable the scrolling of the sidebar menu -->
        <!-- BEGIN SIDEBAR MENU -->
        <ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">                        
            <li class="start active ">
                <a href="Controller">
                    <i class="fa fa-home"></i>
                    <span class="title">
                        Mi Perfil
                    </span>
                    <span class="selected">
                    </span>
                </a>
            </li>
            <li>
                <a href="Controller?action=ListCompanies">
                    <i class="fa fa-shopping-cart"></i>
                    <span class="title">
                        Empresas
                    </span>
                    <span class="arrow ">
                    </span>
                </a>                            
            </li>
            <li>
                <a href="Controller?action=ListTeachers">
                    <i class="fa fa-gift"></i>
                    <span class="title">
                        Profesores
                    </span>
                    <span class="arrow">
                    </span>
                </a>                                                     
            </li>
            <li>
                <a href="Controller?action=CreateUserForm">
                    <i class="fa fa-cogs"></i>
                    <span class="title">
                        Crear Usuarios
                    </span>
                    <span class="arrow ">
                    </span>
                </a>                            
            </li>
            <li>
                <a href="javascript:;">
                    <i class="fa fa-bookmark-o"></i>
                    <span class="title">
                        Grupos
                    </span>
                    <span class="arrow ">
                    </span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="Controller?action=CreateGroupForm">
                            Nuevo
                        </a>
                    </li>
                    <li>
                        <a href="ui_buttons.html">
                            Gestionar
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="fa fa-puzzle-piece"></i>
                    <span class="title">
                        Alumnos
                    </span>
                    <span class="arrow ">
                    </span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="Controller?action=StudentList">
                            Lista
                        </a>
                    </li>        
                    <li>
                        <a href="Controller?action=CreateStudent">
                            Registar
                        </a>
                    </li>                        
                </ul>
            </li>
            <li class="last">
                <a href="javascript:;">
                    <i class="fa fa-table"></i>
                    <span class="title">
                        Informes
                    </span>
                    <span class="arrow ">
                    </span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="Controller?action=GetRegistration">
                            Matricula
                        </a>
                    </li>
                    <li>
                        <a href="Controller?action=GetAttendances">
                            Asistencia
                        </a>
                    </li>                                                        
                </ul>
            </li>                        
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>