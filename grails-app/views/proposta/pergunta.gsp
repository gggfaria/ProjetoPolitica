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
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
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

    <div class="bottom">
        <g:remoteLink controller="proposta" action="listarPerguntas" id="${proposta.id}"
                      class="button button-5 button-5b icon-cart" title="Clique para listar as perguntas já feitas"
                      onSuccess="carregarPerguntas(data)">
            <i class="fa fa-eye" style="color: white"></i>
            <span>ver perguntas</span>
        </g:remoteLink>

    </div>

    <div class="col-md-10" id="perguntasAntigas">

    </div>

</div>




<script>
    function carregarPerguntas(data) {

        $('#perguntasAntigas').html(data)


    }

</script>

<script src="/Politica/js/modal-servico.js"></script>

</body>
</html>