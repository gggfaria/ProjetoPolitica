<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="pt-br" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="pt-br" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="pt-br" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="pt-br" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="pt-br" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="/Politica/js/jquery-3.1.1.min.js"></script>
    <link href="/Politica/css/bootstrap.css" rel="stylesheet">
    <link href="/Politica/css/button.css" rel="stylesheet">
    <link href="/Politica/css/site.css" rel="stylesheet">
    <link href="/Politica/css/bootstrap-datepicker.css" rel="stylesheet">

    <script src="/Politica/js/bootstrap.js"></script>
    <script src="/Politica/js/notify.min.js"></script>

    <g:layoutHead/>
    <g:javascript library="application"/>
    <r:layoutResources/>
</head>

<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/Politica/">Política Municipal</a>
        </div>

        <div id="navbar" class="collapse navbar-collapse navbar-right">
            <ul class="nav navbar-nav">
                <li><a href="/Politica/politico/listar">Políticos</a></li>
                <sec:ifNotLoggedIn>
                    <li><a href="#" onclick="exibirCadastro()">Cadastrar</a></li>
                </sec:ifNotLoggedIn>
                <sec:ifNotLoggedIn>
                    <li><g:link controller='login' action='logar'>Login</g:link></li>
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    <li><a href="/Politica/j_spring_security_logout">Sair</a></li>
                </sec:ifLoggedIn>
            </ul>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <!--<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Notificação<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">TESTE</a></li>
							<li><a href="#">TESTE</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">TESTE</a></li>
						</ul>
					</li>-->
        </ul>
    </div>
</nav>

<sec:ifNotLoggedIn>
    <!--Modal cadastrar -->
    <div class="modal fade" id="modalForm" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" title="Fechar" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="fa fa-times" aria-hidden="true"></i>
                    </button>
                    <h4 class="modal-title">Cadastrar-se</h4>
                </div>

                <div class="modal-body">
                    <g:render template="../eleitor/cadastrar"></g:render>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</sec:ifNotLoggedIn>

<g:layoutBody/>


<hr/>
<footer class="footer text-center">
    Projeto Politica Municipal - 2º Modulo Pós Web.<br/>
    Gabriel Faria<br/>
    Guilherme Prado<br/>
    Felipe Guimarães<br/>
    Willian Gonçalves<br/>

</footer>

<r:layoutResources/>

<script type="text/javascript" src="/Politica/js/select.js"></script>
<script type="text/javascript" src="/Politica/js/comum.js"></script>
<script type="text/javascript" src="/Politica/js/bootstrap-datepicker.js"></script>
<script>

    $.fn.datepicker.dates['pt-BR'] = {
        days: ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"],
        daysShort: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"],
        daysMin: ["Do", "Se", "Te", "Qa", "Qi", "Se", "Sa"],
        months: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
        monthsShort: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
        today: "Hoje",
        clear: "Limpar",
        format: "mm/dd/yyyy",
        titleFormat: "MM yyyy",
        weekStart: 0
    };

    $.fn.datepicker.defaults.format = "mm/dd/yyyy";
    $('#dataNascimento').datepicker({
        format: "dd/mm/yyyy",
        startView: 2,
        clearBtn: true,
        language: "pt-BR",
        orientation: "bottom auto",
        autoclose: true
    });


    function exibirCadastro() {
        $('#modalForm').modal('show')
        $("#nome").focus()
    }
</script>

</body>
</html>
