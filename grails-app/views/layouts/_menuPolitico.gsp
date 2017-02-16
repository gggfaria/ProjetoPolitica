<%@ page import="politica.Pergunta" %>
<meta name="layout" content="main">
<link href="/Politica/css/site.css" rel="stylesheet">
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
                <sec:ifAllGranted roles="ROLE_POLITICO">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true"
                           aria-expanded="false">Propostas</a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="proposta" action="cadastrar">Cadastrar</g:link>
                            <li><g:link controller="proposta" action="index">Editar</g:link></li>
                            <li role="separator" class="divider"></li>

                            <g:include controller="notificacao" action="quantidade"/>
                            <li><g:link controller="politico" action="perguntas">
                                Perguntas <span class="fa fa-question-circle" aria-hidden="true"/><span
                                        class="label label-danger label-as-badge" style="
                                        border-radius: 50%;
                                        position:relative;
                                        top: -10px;
                                        left: 2px;">${session.notificacoes}</span>
                            </g:link></li>
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
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true"
                       aria-expanded="true">
                        <!-- icone -->
                        <i class="fa fa-bell-o" aria-hidden="true"></i>
                        <g:include controller="politico" action="pegarNotificacao"/>
                        <span class="label label-danger label-as-badge" style="
                        border-radius: 50%;
                        position:relative;
                        top: -10px;
                        left: 2px;">${session.notificacoes}</span>
                    </a>
                    <ul class="dropdown-menu" style="width: 350px">
                        <li class="header" style="margin: 5px;">Você tem ${session.notificacoes} mensagem(s) não visualizada(s)</li>
                        <br>
                        <g:include controller="notificacao" action="listar"/>
                        <li class="footer text-center"><a href="#" onclick="mostrarNotificacoes()">Veja mais</a></li>

                    </ul>
                </li>
                <li>
                    <g:link controller="politico" action="meusDados"><sec:loggedInUserInfo field="username"/></g:link>
                </li>
                <sec:ifLoggedIn>
                    <li><a href="/Politica/j_spring_security_logout">
                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                        Sair
                    </a>
                    </li>
                </sec:ifLoggedIn>
            </ul>

        </div>

    </div>
</nav>

<div class="modal fade" id="modalNotificacoes" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" title="Fechar" data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times" aria-hidden="true"></i>
                </button>
                <h4 class="modal-title">Todas notificações</h4>
                <g:include controller="notificacao" action="listarTudo"/>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
    function mostrarNotificacoes(data) {
        $('#modalNotificacoes').modal('show')
    }
</script>