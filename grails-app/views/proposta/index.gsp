<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Cadastro de Proposta</title>
    <link href="/Politica/css/select.css" rel="stylesheet">
    <link href="/Politica/css/bootstrap-datepicker.css" rel="stylesheet">
    <meta name="layout" content="main">
</head>

<body>
<div class="container-fluid">
<h2>Cadastrar Proposta</h2>
<hr/>
<g:formRemote name="formProposta" url="[controller: 'proposta', action: 'salvar']"
              onSuccess="exibirMensagemGenerica(data, 'Sua proposta foi cadastrada com sucesso', true)"
              class="form-group">

    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6 col-xs-12">

                <span class="obrigatorio">*</span>
                <label>Area</label>

                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="fa fa-university" aria-hidden="true"></i>
                    </span>
                    <g:select name="area" from="${listaAreas}" class="form-control" optionValue="nome"
                              optionKey="id"></g:select>
                </div>

                <span class="obrigatorio">*</span>
                <label>Título</label>

                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="fa fa-hashtag" aria-hidden="true"></i>
                    </span>

                    <input type="text" name="titulo" placeholder="Título da proposta" required=""
                           class="form-control">
                </div>

            </div>

            <div class="col-md-6 col-xs-12">
                <span class="obrigatorio">*</span>
                <label>Resumo</label>


                <textarea min="5" rows="3" name="resumo" id="resumo" placeholder="Resumo"
                          required="" class="form-control"></textarea>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="col-md-12">
                <br>
                <span class="obrigatorio">*</span>
                <label>Descrição</label>


                <textarea type="text" min="5" rows="15" name="descricao" placeholder="Descrição" required=""
                          class="form-control"></textarea>
            </div>
        </div>
    </div>


    <div class="col-md-6">
        <button class="button button-5 button-5b icon-cart" name="cadastrar">
            <i class="fa fa-check"></i>
            <span>Cadastrar</span>
        </button>

    </div>


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
</div>

</body>
</html>