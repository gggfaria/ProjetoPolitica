<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Políticos</title>

    <link href="/Politica/css/quadro.css" rel="stylesheet">

    <meta name="layout" content="main">

</head>


<body>
<div class="container-fluid">
    <h1>Políticos</h1>
    <hr/>

    <div class="row">
        <g:each in="${lista}" var="politico">
            <div class="col-md-3 col-sm-6">
                <div class="card hovercard" style="margin: 5px;">
                    <img src="${politico.partido.bandeira}" alt=""/>

                    <div class="avatar">
                        <img src="${politico.foto}" alt=""/>
                    </div>

                    <div class="info">
                        <div class="title">
                            <label>${politico.nome}</label>
                        </div>

                        <div class="desc">${politico.numero}</div>
                    </div>

                    <div class="bottom">

                        <button class="button button-5 button-5b icon-cart" style="width: 100%" name="cadastrar">
                            <i class="fa fa-plus"></i>
                            <span>sobre</span>
                        </button>

                    </div>

                    <div class="bottom">
                        <g:remoteLink controller="politico" action="exibirPropostas" style="width: 100%"
                                      id="${politico.id}"
                                      class="button button-5 button-5b icon-cart"
                                      onSuccess="mostrarProposta(data)">
                            <i class="fa fa-eye" style="color: white"></i>
                            <span>ver propostas</span>
                        </g:remoteLink>

                    </div>
                </div>
            </div>
        </g:each>
    </div>
</div>


<div class="modal fade" id="modalProposta" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" title="Fechar" data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times" aria-hidden="true"></i>
                </button>
                <h4 class="modal-title">Propostas</h4>
                <h5 class="modal-title">Áreas</h5>
            </div>

            <div class="modal-body">
                <div id="conteudoProposta">

                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<script>
    function redirecionarPerguntaProposta(id) {
        window.location = "../proposta/detalhes/" + id;
    }

    function mostrarProposta(data) {
        /*var propostas = data.propostas
         var areas = data.areas*/
        $('#modalProposta').modal('show')

        $('#conteudoProposta').html(data)

    }

</script>

</body>
</html>