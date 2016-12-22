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
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle"  data-toggle="dropdown" role="button"
                           aria-haspopup="true"
                           aria-expanded="true">Notificações</a>
                        <ul class="dropdown-menu" style="width: 350px">
                            <li class="col-lg-offset-6">
                                <button id="deletar" type='link' class='btn btn-primary col-lg-offset-6'
                                        title='Limpar notificações'>
                                    Limpar

                                </button>
                            </li>

                            <li id="dados">
                                <g:formRemote id="myForm" name="myForm" update="updateMe" url="[controller: 'notificacao', action:'listar']" onSuccess="mostrarNotificacoes(data)">

                                </g:formRemote>
                                <g:render template="/notificacao/news" />
                            </li>


                            <li class="col-lg-offset-0">
                                <button id="exibir" type='link' class='btn btn-primary col-lg-offset-6'
                                        title='Ver notificações antigas'>
                                    Veja mais

                                </button>
                            </li>

                        </ul>
                    </li>
                </sec:ifAllGranted>
            </ul>
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

<script>
    $(document).ready(function() {
        $('#myForm').submit();
        alert('cheguei aqui')
    });

    function mostrarNotificacoes(data) {
        /*var propostas = data.propostas
         var areas = data.areas*/


    }
</script>