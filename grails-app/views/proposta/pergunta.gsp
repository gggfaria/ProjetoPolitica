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
    <meta name="layout" content="main">
</head>

<body>

<div class="container-fluid">
    <h2>Proposta</h2>
    <hr/>
    <h4>Proposta de ${proposta.politico.nome}</h4>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">${proposta?.titulo}</div>

                <div class="panel-body">
                    <p>${proposta?.descricao}</p>
                </div>
            </div>
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
                            <label>Faça sua pergunta</label>
                            <textarea name="descricao" class="form-control" style="max-width: 100%;"></textarea>
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


    <h3>Perguntas sobre a proposta</h3>
    <hr/>

    <div id="ListaPerguntas">
    </div>

</div>





<script>

    $(document).ready(function () {
        $('#ListaPerguntas').fadeToggle()
        atualizarPerguntas(${proposta.id})
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


</script>

</body>
</html>