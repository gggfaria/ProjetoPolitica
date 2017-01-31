<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-collapse" aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <g:link url="/Politica" class="navbar-brand">
                Política Municipal
            </g:link>
        </div>

        <div id="bs-collapse" class="collapse navbar-collapse navbar-right">
            <ul class="nav navbar-nav">
                <sec:ifAllGranted roles="ROLE_ELEITOR">

                    <ul class="nav navbar-nav">
                        <li>
                            <g:link controller="pergunta" action="listar">
                                Minhas Perguntas
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="politico" action="listar">
                                Políticos
                            </g:link>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="true">
                                <!-- icone -->
                                <i class="fa fa-bell-o" aria-hidden="true"></i>

                                <g:include controller="notificacao" action="quantidade"/>
                                <span class="label label-danger label-as-badge" style="
                                border-radius: 50%;
                                position:relative;
                                top: -10px;
                                left: 2px;">${session.notificacoes}</span>

                            </a>
                            <ul class="dropdown-menu" style="width: 390px">
                                <li class="header">Você tem ${session.notificacoes} mensagem(s) não visualizada(s)</li>
                                <br>
                                <g:include controller="notificacao" action="listar"/>
                                <li class="footer text-center"><a href="#">Veja mais</a></li>
                            </ul>
                        </li>
                        <li>
                            <g:link controller="eleitor" action="index"><sec:loggedInUserInfo
                                    field="username"/></g:link>
                        </li>
                        <sec:ifLoggedIn>
                            <li><a href="/Politica/j_spring_security_logout">
                                <i class="fa fa-sign-out" aria-hidden="true"></i>
                                Sair
                            </a>
                            </li>
                        </sec:ifLoggedIn>
                    </ul>
                </sec:ifAllGranted>
            </ul>

        </div>

    </div>
</nav>

