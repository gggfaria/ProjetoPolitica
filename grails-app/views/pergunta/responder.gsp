<%--
  Created by IntelliJ IDEA.
  User: Gabriel
  Date: 02/12/2016
  Time: 23:41
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Responder</title>
    <meta name="layout" content="main">
</head>

<body>
<div class="container-fluid">

    <h2>Responder à pergunta</h2>
    <h3>${pergunta.descricao}</h3>
    <hr/>
    <h4>Eleitor: ${pergunta.pessoa.nome}</h4>

    <div class="row">
        <div class="col-md-11">
            <div class="panel panel-primary">
                <div class="panel-heading">${pergunta.proposta.titulo}</div>

                <div class="panel-body">
                    <p>${pergunta.proposta.descricao}</p>
                </div>
            </div>
        </div>
    </div>


    <hr/>
    <g:formRemote name="formResposta" url="[controller: 'resposta', action: 'salvar']" class="form-group"
                  onSuccess="exibirMensagemAdicionarPergunta(data,${pergunta.id})"
                  onFailure="ModalServico.exibirRespostaErroPadrao(XMLHttpRequest)">
        <input type="hidden" name="propostaId" value="${pergunta?.id}"/>

        <div class="row">
            <div class="col-md-12" style="margin-left: 25px">
                <div class="row">
                    <div class="col-md-10">
                        <span class="obrigatorio">*</span>
                        <label>Resposta</label>
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

</div>
</body>
</html>