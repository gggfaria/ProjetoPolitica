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
                <sec:ifAllGranted roles="ROLE_ELEITOR">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true"
                           aria-expanded="false">Perguntas</a>
                        <ul class="dropdown-menu">
                            <g:include controller="eleitor" action="notificacao"/>
                            <li><a href="/Politica/perguntas/">Respondidas
                                <span
                                        class="label label-danger label-as-badge" style="
                                border-radius: 50%;
                                position:relative;
                                top: -10px;
                                left: 2px;">${session.respondidas}</span></a></li>
                            <li><a href="/Politica/perguntas/listar">Não respondidas
                                <span
                                        class="label label-danger label-as-badge" style="
                                border-radius: 50%;
                                position:relative;
                                top: -10px;
                                left: 2px;">${session.naoRespondidas}</span></a></li>
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
                    <g:link controller="eleitor" action="index"><sec:loggedInUserInfo field="username"/></g:link>
                </li>
                <sec:ifLoggedIn>
                    <li><a href="/Politica/j_spring_security_logout">Sair</a></li>
                </sec:ifLoggedIn>
            </ul>

        </div>

    </div>
</nav>
