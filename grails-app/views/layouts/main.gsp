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
		<r:layoutResources />
	</head>
	<body>

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/Politica/">Política Municipal</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse navbar-right">
					<ul class="nav navbar-nav">
						<li><a href="/Politica/politico/listar">Políticos</a></li>
						<li><a href="#" onclick="exibirCadastro()">Cadastrar</a></li>
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

        <g:layoutBody/>



    <footer class="footer text-center">
        2016 Projeto Politica Municipal - 2º Modulo Pós Web.
    </footer>

        <r:layoutResources />

    <script type="text/javascript" src="/Politica/js/select.js"></script>
    <script type="text/javascript" src="/Politica/js/comum.js"></script>
    <script type="text/javascript" src="/Politica/js/bootstrap-datepicker.js"></script>
    <script>

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
