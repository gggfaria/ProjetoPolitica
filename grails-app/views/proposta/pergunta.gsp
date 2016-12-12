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
        <div class="col-md-11">
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
        <g:formRemote name="formPergunta" url="[controller: 'pergunta', action: 'enviar']" class="form-group"
                      onSuccess="exibirMensagemAdicionarPergunta(data,${proposta.id})"
                      onFailure="ModalServico.exibirRespostaErroPadrao(XMLHttpRequest)">
            <input type="hidden" name="propostaId" value="${proposta?.id}"/>

            <div class="row">
                <div class="col-md-12" style="margin-left: 25px">
                    <div class="row">
                        <div class="col-md-10">
                            <span class="obrigatorio">*</span>
                            <label>Faça sua pergunta</label>
                            <textarea name="descricao" class="form-control" style="max-width: 100%;"></textarea>
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
        </g:formRemote>
    </sec:ifAllGranted>

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


    <hr/>

    <h3>Perguntas sobre a proposta</h3>
    <div id="ListaPerguntas">

        <g:each in="${proposta.perguntas}" var="pergunta">

            <div class="col-md-10" id="perguntasAntigas">
                <div class="col-md-10">
                    <div class="testimonial testimonial-default">
                        <div class="testimonial-section">
                            ${pergunta.descricao}
                        </div>

                        <div class="testimonial-desc">

                            <div class="testimonial-writer">
                                <div class="testimonial-writer-name">${pergunta.pessoa.nome}</div>

                                <div class="testimonial-writer-designation">${pergunta.data.format("dd/MM/yyyy HH:mm")}</div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <g:if test="${pergunta.resposta != null}">
                <div class="col-md-10" style="margin-left: 50px" id="perguntasAntigas">
                    <div class="col-md-10">
                        <div class="testimonial testimonial-primary">
                            <div class="testimonial-section">
                                ${pergunta.resposta?.descricao}
                            </div>

                            <div class="testimonial-desc">
                                <div class="testimonial-writer">
                                    <div class="testimonial-writer-name" id="${pergunta?.id}">${pergunta.resposta?.politico?.nome}</div>
                                    <div class="testimonial-writer-designation">${pergunta.resposta?.data?.format("dd/MM/yyyy hh:mm")}</div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </g:if>

        </g:each>


    </div>
</div>





<script>



    function mostrarProposta(data) {

        $('#ListaPerguntas').fadeToggle()
        $('#ListaPerguntas').html(data).fadeToggle();
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