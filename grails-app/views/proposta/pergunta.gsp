<%--
  Created by IntelliJ IDEA.
  User: Willian
  Date: 14/11/2016
  Time: 12:17
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Proposta - Perguntas</title>
    <link href="/Politica/css/Testimonials.css" rel="stylesheet">
    <link href="/Politica/css/rating.css" rel="stylesheet">
    <meta name="layout" content="main">
    <style>
    .estrela {
        cursor: pointer;
    }
    </style>
</head>

<body>

<div class="container-fluid">
    <h2>Proposta</h2>
    <hr/>
    <h4>${proposta.politico.nome}</h4>
    <br/>

    <div class="col-md-12">
        <div class="row">
            <div class="col-md-7 col-lg-7 col-xs-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">${proposta?.titulo}
                    </div>

                    <div class="panel-body">
                        <p>${proposta?.descricao}</p>
                    </div>
                    <sec:ifAllGranted roles="ROLE_ELEITOR">
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <label style="margin-bottom: 0 !important;">Avalie:</label>
                                    <span class="starRating">
                                        <input id="rating5" class="estrela" type="radio" name="rating"
                                               onclick="classificarProposta(${proposta.id}, 5)">
                                        <label for="rating5">5</label>
                                        <input id="rating4" class="estrela" type="radio" name="rating"
                                               onclick="classificarProposta(${proposta.id}, 4)">
                                        <label for="rating4">4</label>
                                        <input id="rating3" class="estrela" type="radio" name="rating"
                                               onclick="classificarProposta(${proposta.id}, 3)">
                                        <label for="rating3">3</label>
                                        <input id="rating2" class="estrela" type="radio" name="rating"
                                               onclick="classificarProposta(${proposta.id}, 2)">
                                        <label for="rating2">2</label>
                                        <input id="rating1" class="estrela" type="radio" name="rating"
                                               onclick="classificarProposta(${proposta.id}, 1)">
                                        <label for="rating1">1</label>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </sec:ifAllGranted>
                </div>
            </div>

            <div class="col-lg-5 col-md-5 col-xs-12" id="avaliacao">
            </div>

        </div>

        <sec:ifAllGranted roles="ROLE_ELEITOR">
            <h2>Enviar pergunta</h2>
            <hr/>
            <g:formRemote name="formPergunta" url="[controller: 'pergunta', action: 'salvar']" class="form-group"
                          onSuccess="exibirMensagemAdicionarPergunta(data,${proposta.id})">

                <input type="hidden" name="propostaId" value="${proposta.id}"/>

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">
                                <span class="obrigatorio">*</span>
                                <label>Pergunta para ${proposta.politico.nome}:</label>
                                <textarea name="descricao" class="form-control" rows="5"
                                          placeholder="Digite sua pergunta aqui..."
                                          style="max-width: 100%;"></textarea>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-12">
                        <button class="button button-5 button-5b icon-cart" name="enviar">
                            <i class="fa fa-check"></i>
                            <span>enviar</span>
                        </button>
                    </div>
                </div>

                <br/>
            </g:formRemote>
        </sec:ifAllGranted>
    </div>

    <sec:ifNotGranted roles="ROLE_ELEITOR">
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-warning" role="alert">
                    <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                    <strong>Eleitor</strong>, acesse com o seu usuário para fazer uma pergunta.
                <g:link controller="login" action="logar" style="color: #0b30f5 !important;">
                    Clique aqui!
                </g:link>
                </div>

            </div>
        </div>
    </sec:ifNotGranted>



    <div class="modal fade" tabindex="-1" role="dialog" id="mensagemModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            onclick="carregarPerguntas(${proposta.id})" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Informação</h4>
                </div>

                <div class="modal-body">
                    <div id="mensagem" role="alert"></div>

                    <div id="mensagemErros" role="alert"></div>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    <h3><i class="fa fa-comments"></i> Perguntas feitas pelos eleitores</h3>

    <hr/>

    <div id="ListaPerguntas">
    </div>

</div>

</div>





<script>
    $(document).ready(function () {
        $('#ListaPerguntas').fadeToggle()
        $('#avaliacao').fadeToggle()
        atualizarPerguntas(${proposta.id})

        carregarMediaNota(${proposta.id})

        <sec:ifAllGranted roles="ROLE_ELEITOR">
            carregarNota(${proposta.id})
        </sec:ifAllGranted>

    });

    function mostrarPerguntas(data) {
        $('#ListaPerguntas').html(data).fadeToggle();
    }

    function atualizarPerguntas(id) {
        $.ajax({
            url: "/Politica/Proposta/atualizarPerguntas/",
            data: {
                id: id
            },
            method: "post",
            success: function (data) {
                mostrarPerguntas(data)
            }
        })
    }

    function classificarProposta(id, valor) {
        $.ajax({
            url: "${g.createLink(controller:'proposta',action:'avaliar')}",
            data: {
                id: id,
                valor: valor
            },
            method: "post",
            success: function (data) {
                exibirMensagemGenerica(data, 'Avaliado com sucesso', false)
            }
        })
    }

    function mostrarMediaNota(data) {
        $('#avaliacao').html(data).fadeToggle();
    }


    function carregarMediaNota(id) {
        $.ajax({
            url: "${g.createLink(controller:'nota',action:'carregarMediaNotas')}",
            data: {
                id: id,
            },
            method: "post",
            success: function (data) {
                mostrarMediaNota(data)
            }
        })
    }

    <sec:ifAllGranted roles="ROLE_ELEITOR">
    function carregarNota(id) {
        $.ajax({
            url: "${g.createLink(controller:'nota',action:'carregarNotaUsuario')}",
            data: {
                id: id,
            },
            method: "post",
            success: function (data) {
                $("#rating" + data.valor).attr("checked", true)

            }
        })
    }
    </sec:ifAllGranted>
</script>

</body>
</html>