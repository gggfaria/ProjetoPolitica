<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-collapse" aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <g:link controller="eleitor" action="index" class="navbar-brand">
                Política Municipal
            </g:link>
        </div>

        <div id="bs-collapse" class="collapse navbar-collapse navbar-right">
            <ul class="nav navbar-nav">
                <sec:ifAllGranted roles="ROLE_POLITICO">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true"
                           aria-expanded="false">Propostas</a>
                        <ul class="dropdown-menu">
                            <li><a href="/Politica/proposta/">Cadastrar</a></li>
                            <li><a href="#">Editar</a></li>
                            <!-- <li role="separator" class="divider"></li>
                        <li><a href="#"></a></li>-->
                        </ul>
                    </li>
                </sec:ifAllGranted>
            </ul>


            <ul class="nav navbar-nav">
                <li>
                    <g:link controller="politico" action="listar">
                        Políticos
                    </g:link>
                </li>
                <li>
                    <g:link controller="politico" action="meusDados"><sec:loggedInUserInfo field="username"/></g:link>
                </li>
                <sec:ifLoggedIn>
                    <li><a href="/Politica/j_spring_security_logout">Sair</a></li>
                </sec:ifLoggedIn>
            </ul>

        </div>

    </div>
</nav>