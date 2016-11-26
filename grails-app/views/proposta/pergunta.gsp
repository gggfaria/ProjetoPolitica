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
    <h4><strong>Proposta:</strong> ${proposta?.titulo}</h4>
    <hr/>

        <g:formRemote name="formPergunta" url="[controller: 'pergunta', action: 'enviar']" class="form-group"
                  onSuccess="ModalServico.exibirRespostaPadrao(data)"
                  onFailure="ModalServico.exibirRespostaErroPadrao(XMLHttpRequest)">
        <input type="hidden" name="propostaId" value="${proposta?.id}"/>

        <div class="row">
            <div class="col-md-12" style="margin-left: 25px">
                <div class="row">
                    <div class="col-md-6">
                        <span class="obrigatorio">*</span>
                        <label>Descrição da Pergunta</label>
                        <textarea name="descricao" class="form-control"></textarea>
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
                    <div id="tb-testimonial" class="testimonial testimonial-default">
                        <div class="testimonial-section">
                            ${pergunta.descricao}
                        </div>

                        <div class="testimonial-desc">
                            <img src="https://placeholdit.imgix.net/~text?txtsize=9&txt=100%C3%97100&w=100&h=100"
                                 alt=""/>

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
        $("input").val('')
        $('#ListaPerguntas').html(data)

    }

    function carregarPerguntas(id) {
        <g:remoteLink controller="proposta" action="listarPerguntas" id="'+id+'" update="ListaPerguntas">
        </g:remoteLink>
        //TODO FAZER POR AJAX

    }


</script>

<script src="/Politica/js/modal-servico.js"></script>

</body>
</html>