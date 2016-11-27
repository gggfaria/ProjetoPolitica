<%--
  Created by IntelliJ IDEA.
  User: Willian
  Date: 14/11/2016
  Time: 12:17
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Enviar Pergunta</title>
    <link href="/Politica/css/Testimonials.css" rel="stylesheet">
    <meta name="layout" content="main">
</head>

<body>

<div class="container-fluid">
    <h2>Enviar Pergunta</h2>
    <hr/>
    <h4>Proposta de ${proposta.politico.nome}</h4>
    <div class="row">
        <div class="col-md-11">
            <div class="panel panel-primary">
                <div class="panel-heading">${proposta?.titulo}</div>

                <div class="panel-body">
                    <p>${proposta?.descricao}</p>
                </div>
            </div>
        </div>
    </div>

    <hr/>

    <g:formRemote name="formPergunta" url="[controller: 'pergunta', action: 'enviar']" class="form-group"
                  onSuccess="exibirMensagemAdicionarPergunta(data,${proposta.id})"
                  onFailure="ModalServico.exibirRespostaErroPadrao(XMLHttpRequest)">
        <input type="hidden" name="propostaId" value="${proposta?.id}"/>

        <div class="row">
            <div class="col-md-12" style="margin-left: 25px">
                <div class="row">
                    <div class="col-md-10">
                        <span class="obrigatorio">*</span>
                        <label>Descrição da Pergunta</label>
                        <textarea name="descricao" class="form-control" style="max-width: 80%;"></textarea>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-12" style="margin-left: 25px">
                <button class="button button-5 button-5b icon-cart" name="enviar">
                    <i class="fa fa-check"></i>
                    <span>enviar</span>
                </button>
            </div>
        </div>



        <br/>


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

    </g:formRemote>
    <hr/>


    <div id="ListaPerguntas">

        <g:each in="${proposta.perguntas}" var="pergunta">

            <div class="col-md-10" id="perguntasAntigas">
                <div class="col-sm-6">
                    <div class="testimonial testimonial-default">
                        <div class="testimonial-section">
                            ${pergunta.descricao}
                        </div>

                        <div class="testimonial-desc">

                            <div class="testimonial-writer">
                                <div class="testimonial-writer-name">${pergunta.pessoa.nome}</div>

                                <div class="testimonial-writer-designation">${pergunta.data.format("dd/MM/yyyy hh:mm")}</div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </g:each>
    </div>
</div>





<script>

    function mostrarProposta(data) {

        $('#ListaPerguntas').html(data)

    }


    function atualizarPerguntas(id) {
        $.ajax({
            url: "../listarPerguntas/" + id,
            data: {
                id: id
            },
            method: "post",
            success: function (data) {
                mostrarProposta(data)
            }
        })
    }


</script>

<script src="/Politica/js/modal-servico.js"></script>

</body>
</html>