<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Editar Proposta</title>
    <link href="/Politica/css/select.css" rel="stylesheet">
    <link href="/Politica/css/bootstrap-datepicker.css" rel="stylesheet">

    <meta name="layout" content="main">

</head>

<body>
<div class="container-fluid">
    <h2>Editar Proposta</h2>
    <hr/>

    <div class="col-md-8">
        <span class="obrigatorio">*</span>
        <label>Selecione uma proposta</label>
        <br>
    </div>

    <div class="input-group">
        <input type="text" id="myInput" class="form-control" onkeyup="BuscaProposta()" placeholder="Procurar por Titulo"
               title="Type in a name">

        <span class="input-group-addon">
            <i class="fa fa-search" aria-hidden="true"></i>
        </span>
    </div>
    <br>
    <table style="width: 100%" class="table table-responsive table-bordered table-hover" id="tablePropostas">
        <thead style="background-color:#f8f8f8">
        <tr>
            <th>ID</th>
            <th>Area</th>
            <th>Titulo</th>
            <th>Resumo</th>
            <th>Descrição</th>
            <th>Editar</th>
            <th>Perguntas</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${listaProposta}" var="proposta">
            <tr id="linhaProposta${proposta.id}">
                <td>
                    ${proposta?.id}
                </td>

                <td>${proposta.area.nome}</td>
                <td>${proposta.titulo}</td>
                <td style="max-width:20vw;   text-overflow:ellipsis;
                overflow:hidden;  white-space:nowrap">${raw(proposta.resumo)}</td>
                <td style="max-width:20vw; white-space:nowrap;   text-overflow:ellipsis;
                overflow:hidden">${raw(proposta.descricao)}</td>
                <td align='center'><g:remoteLink controller="proposta" action="listarProposta"
                                                 onclick="mostrarProposta(data)"
                                                 style="width: 100%"
                                                 id="${proposta.id}"
                                                 onSuccess="mostrarProposta(data)">
                    <i class="fa fa-search" aria-hidden="true"></i>
                </g:remoteLink></td>
                <td>
                    <g:link controller="pergunta" action="index" id="${proposta.id}">Perguntas</g:link>
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>


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

</div>

<div class="modal fade" id="modalForm" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" title="Fechar" data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times" aria-hidden="true"></i>
                </button>
                <h4 class="modal-title">Propostas</h4>

                <div class="modal-body">
                    <div class="col-md-12">
                        <g:formRemote name="formProposta" url="[controller: 'proposta', action: 'atualizar']"
                                      onSuccess="exibirUpdate(data); carregarLista(data)"
                                      class="form-group">
                            <div class="col-md-6">
                                <br>
                                <input type="hidden" id="id" name="id">
                                <span class="obrigatorio">*</span>
                                <label>Area</label>

                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-university" aria-hidden="true"></i>
                                    </span>
                                    <g:select name="area" from="${listaAreas}" id="area" class="form-control"
                                              optionValue="nome"
                                              optionKey="id"></g:select>
                                </div>
                                <span class="obrigatorio">*</span>
                                <label>Titulo</label>

                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-hashtag" aria-hidden="true"></i>
                                    </span>
                                    <input type="text" name="titulo" id="titulo" placeholder="Titulo" required=""
                                           class="form-control">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <br>
                                <span class="obrigatorio">*</span>
                                <label>Resumo</label>
                                <textarea type="text" min="5" rows="4" name="resumo" id="resumo"
                                          placeholder="resumo"
                                          required="" class="form-control">
                                </textarea>
                            </div>

                            <div class="col-md-12">
                                <br>
                                <span class="obrigatorio">*</span>
                                <label>Descrição</label>
                                <textarea type="text" min="5" rows="15" name="descricao" id="descricao"
                                          placeholder="Descricao"
                                          required=""
                                          class="form-control">
                                </textarea>
                            </div>

                            <div class="col-md-6">
                                <button class="button button-5 button-5b icon-cart" name="cadastrar">
                                    <i class="fa fa-check"></i>
                                    <span>Editar</span>
                                </button>
                            </div>
                        </g:formRemote>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript" src="../js/select.js"></script>
<script type="text/javascript" src="../js/comum.js"></script>

<script type="text/javascript">
    function mostrarProposta(data) {
        var propostas = data.propostas
        var areas = data.areas


        $('#descricao').val(data.descricao)
        $('#resumo').val(data.resumo)
        $('#titulo').val(data.titulo)
        $('#id').val(data.id)
        $('#area').val('a')
        $('#modalForm').modal('show')
    }


    function BuscaArea(id) {
        var  table, tr, td, i;


        table = document.getElementById("tablePropostas");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }


    function alterarProposta(id) {
        $.ajax({
            url: "/Politica/proposta/listarProposta/" + id,
            data: {
                id: id
            },
            method: "post",
            success: function (data) {
                mostrarProposta(data)
            }
        })
    }
    function BuscaProposta() {
        var input, filter, table, tr, td, i;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("tablePropostas");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[2];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    function carregarLista(data) {
        var dropdown = document.getElementById("area");
        var selected = dropdown.options[dropdown.selectedIndex].innerHTML;

        var colunas = "<td>" + data.id + "</td>" +
                "<td>" + selected + "</td>" +
                "<td>" + data.titulo + "</td>" +
                "<td style=\"max-width:20vw; white-space:nowrap;   text-overflow:ellipsis;" +
                "overflow:hidden\">" + data.resumo + "</td>" +
                "<td style=\"max-width:20vw; white-space:nowrap;   text-overflow:ellipsis;" +
                "overflow:hidden\">" +
                data.descricao + "</td>" +
                "<td align='center'><a href='#' onclick=\"alterarProposta(" + data.id + ")\" > <i class=\"fa fa-search\" aria-hidden=\"true\"></i></a></td>" +
                "<td><a href='#' onclick=\"excluir(" + data.id + ")\">Perguntas</a></td>";
        //verifica se existe a linha do humorista existe na tabela
        var linha = $("#linhaProposta" + data.id);
        if (linha.attr("id") != undefined) {
            linha.html(colunas) // substittui as colunas da linhas
        } else {

            $("#tablePropostas tbody").append("<tr id='linhaProposta" + data.id + "'>" +
                    colunas +
                    "</tr>"
            )
        }

    }




</script>



</div>

</div>

</body>

</html>