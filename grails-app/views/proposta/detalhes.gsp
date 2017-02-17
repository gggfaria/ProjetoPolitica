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
    <link href="/Politica/css/loading.css" rel="stylesheet">
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

    <div class="col-md-12">
        <div class="row">
            <div class="col-md-7 col-lg-7 col-xs-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">${proposta?.titulo}
                    </div>

                    <div class="panel-body" style="word-wrap: break-word;
                    overflow-wrap: break-word;
                    width: 100%;">
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

            <div class="col-lg-5 col-md-5 col-xs-12 text-center">
                <div class="well well-sm center" style="min-height: 100%;" id="avaliacao">
                    <div class='uil-squares-css' style='transform:scale(0.6); margin-left: auto; margin-right: auto'>
                        <div><div></div></div>

                        <div><div></div></div>

                        <div><div></div></div>

                        <div><div></div></div>

                        <div><div></div></div>

                        <div><div></div></div>

                        <div><div></div></div>

                        <div><div></div></div>
                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="text-center">

                    <g:if test="${proposta.status.toString() == "CANCELADA"}">
                        <h3 style="color: #8e44ad">${proposta.status.id} <i class="fa fa-frown-o"
                                                                            aria-hidden="true"></i></h3>
                    </g:if>
                    <g:if test="${proposta.status.toString() == "RECUSADA"}">
                        <h3 style="color: #e74c3c">${proposta.status.id} <i class="fa fa-thumbs-down"
                                                                            aria-hidden="true"></i></h3></h3>
                    </g:if>
                    <g:if test="${proposta.status.toString() == "AGUARDANDO"}">
                        <h3 style="color: #2980b9">${proposta.status.id} <i class="fa fa-hourglass-start"
                                                                            aria-hidden="true"></i></h3>
                    </g:if>
                    <g:if test="${proposta.status.toString() == "DESENVOLVIMENTO"}">
                        <h3 style="color: #f39c12">${proposta.status.id} <i class="fa fa-cogs"
                                                                            aria-hidden="true"></i>
                        </h3>
                    </g:if>
                    <g:if test="${proposta.status.toString() == "CUMPRIDA"}">
                        <h3 style="color: #27ae60">${proposta.status.id} <i class="fa fa-thumbs-up"
                                                                            aria-hidden="true"></i></h3>
                    </g:if>
                    <hr>
                </div>

                <p><b>Autor:</b><i>${proposta.politico.nome}</i> ${proposta.politico.cargo} <b>Partido:</b> <i>${proposta.politico.numero} - ${proposta.politico.partido.sigla}</i>
                    <br>
                    <b>Data de publicação: </b><i>${proposta.dataPublicacao.format("dd/MM/yyyy hh:mm")}</i>
                </p>

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
                    <strong>Eleitor</strong>, acesse com o seu usuário para fazer uma pergunta e avaliar a proposta.
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

        /*  setTimeout(function () {
         $('#infoAvaliacao').animate({opacity: 1}, "slow");
         }, 1000)
         */


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
                carregarMediaNota(id)
            }
        })
    }

    function mostrarMediaNota(data) {
        $('#avaliacao').html(data);
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