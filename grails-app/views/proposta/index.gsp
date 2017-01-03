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
            <th>Editar</th>
            <th>Detalhes</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${propostas}" var="proposta">
            <tr>
                <td>
                    <i class="fa ${proposta.area.icone}"></i>
                    ${proposta.area.nome}
                </td>
                <td>${proposta.titulo}</td>
                <td>${proposta.dataPublicacao.format("dd/MM/yyyy")}
                <td class="text-center">
                    <g:remoteLink controller="proposta" action="formEditarProposta" id="${proposta.id}"
                                  onSuccess="mostrarProposta(data)" title="Abrir edição da proposta">
                        <i class="fa fa-pencil-square-o fa-2x"></i>
                    </g:remoteLink>
                </td>
                <td class="text-center">
                    <g:link controller="proposta" action="pergunta" id="${proposta.id}" title="Visualizar proposta completa">
                        <i class="fa fa-plus fa-2x"></i>
                    </g:link>
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
<script src="../js/validacao.js"></script>
<script>

    function mostrarProposta(data){

        $('#modalProposta').modal('show')

        $('#conteudoProposta').html(data)

    }
</script>
</body>
</html>