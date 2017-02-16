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
    <h2>Propostas</h2>
    <hr/>



    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th>Área</th>
            <th>Título</th>
            <th>Publicação</th>
            <th>Editar proposta</th>
            <th>Detalhes</th>
            <th colspan="2">Status</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${propostas}" var="proposta">
            <tr id="proposta${proposta.id}">
                <td id="area${proposta.id}">
                    <i class="fa ${proposta.area.icone}"></i>
                    ${proposta.area.nome}
                </td>
                <td id="titulo${proposta.id}">${proposta.titulo}</td>
                <td>${proposta.dataPublicacao.format("dd/MM/yyyy")}
                <td class="text-center">
                    <g:remoteLink controller="proposta" action="formEditarProposta" id="${proposta.id}"
                                  onSuccess="mostrarProposta(data); contadorCaracteres('#resumo', '#quantidadeDigitadaResumo');
                                             contadorCaracteres('#descricao', '#quantidadeDigitadaDescricao')"
                                  title="Abrir edição da proposta">
                        <i class="fa fa-pencil-square-o fa-2x"></i>
                    </g:remoteLink>
                </td>
                <td class="text-center">
                    <g:link controller="proposta" action="detalhes" id="${proposta.id}"
                            title="Visualizar proposta completa">
                        <i class="fa fa-plus fa-2x"></i>
                    </g:link>
                </td>
                <td id="status${proposta.id}" class="text-center">
                    ${proposta.status?.id}
                </td>
                <td>
                    <g:remoteLink controller="proposta" action="formEditarProposta" name="status${proposta.id}" id="${proposta.id}"
                                  onSuccess="mostrarStatus(${proposta.id})">
                        <i class="fa fa-pencil-square-o fa-2x"></i>
                    </g:remoteLink>
                </td>
            </tr>
        </g:each>

        </tbody>
    </table>
    <div class="modal fade" id="modalProposta" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" title="Fechar" data-dismiss="modal" aria-label="Close">
                        <i class="fa fa-times" aria-hidden="true"></i>
                    </button>
                    <h4 class="modal-title">Editar</h4>

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

</div>

<div class="modal fade" id="modalStatus" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" title="Fechar" data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times" aria-hidden="true"></i>
                </button>
                <h4 class="modal-title">Alterar Status</h4>
            </div>

            <div class="modal-body">
                <g:formRemote name="formProposta" url="[controller: 'proposta', action: 'alterarStatus']"
                              onSuccess="exibirMensagemGenerica(data, 'Status atualizado com sucesso', true); atualizarLinha(data)"
                              class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <input type="hidden" id="idProposta" name="idProposta">
                            <span class="obrigatorio">*</span>
                            <label>Status da Proposta</label>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-info" aria-hidden="true"></i>
                                </span>
                                <select name="status" class="form-control" required="">
                                    <option value="AGUARDANDO">Aguardando</option>
                                    <option value="DESENVOLVIMENTO">Em desenvolvimento</option>
                                    <option value="CUMPRIDA">Concluída</option>
                                    <option value="RECUSADA">Recusada</option>
                                    <option value="CANCELADA">Cancelada</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <button class="button button-5 button-5b icon-cart" name="cadastrar">
                                <i class="fa fa-check"></i>
                                <span>Editar</span>
                            </button>
                        </div>
                    </div>
                </g:formRemote>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</div>



<script src="../js/comum/validacao.js"></script>
<script>

    function mostrarProposta(data) {

        $('#modalProposta').modal('show')

        $('#conteudoProposta').html(data)

    }


    function mostrarStatus(id) {
        $('#idProposta').val(id)
        $('#modalStatus').modal('show')


    }

    function atualizarLinha(data) {
        $("#titulo" + data.proposta.id).text(data.proposta.titulo)
        $("#status" + data.proposta.id).text(data.status)


        var areaTr = $("#area" + data.proposta.id)
        var areaIcone = $("#area" + data.proposta.id + ' i')

        //alterando icone
        areaIcone.attr('class', 'fa ' + data.area.icone)

        areaTr.text(' ' + data.area.nome)
        areaTr.prepend(areaIcone)
    }


</script>
</body>
</html>