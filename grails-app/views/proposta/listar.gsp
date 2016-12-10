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


    <div class="col-md-12">

        <div class="col-md-6">
            <span class="obrigatorio">*</span>
            <label>Selecione uma proposta</label>

        </div>
        <br/>
        <table style="width: 100%" class="table table-responsive table-bordered" id="tablePropostas">
            <thead>
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
                    overflow:hidden;  white-space:nowrap">${proposta.resumo.encodeAsHTML()}</td>
                    <td style="max-width:20vw; white-space:nowrap;   text-overflow:ellipsis;
                    overflow:hidden" >${proposta.descricao}</td>
                    <td><g:remoteLink controller="proposta" action="exibirPropostas" style="width: 100%"
                                      id="${proposta.id}"
                                      onSuccess="mostrarProposta(data)">
                        Editar
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
    <div class="modal fade" id="modalProposta" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" title="Fechar" data-dismiss="modal" aria-label="Close">
                        <i class="fa fa-times" aria-hidden="true"></i>
                    </button>
                    <h4 class="modal-title">Propostas</h4>
                    <h5 class="modal-title">Áreas</h5>
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

    <script type="text/javascript" src="../js/select.js"></script>
    <script type="text/javascript" src="../js/comum.js"></script>
    <script type="text/javascript" src="../js/nicEdit.js"></script>
    <script type="text/javascript">
        //<![CDATA[
        bkLib.onDomLoaded(function () {
            nicEditors.allTextAreas()
        });
        function mostrarProposta(data) {
            /*var propostas = data.propostas
             var areas = data.areas*/
            $('#modalProposta').modal('show')

            $('#conteudoProposta').html(data)

        }
    </script>



    <script>
        /*   function exibirMensagem(data) {
         if (data.erro) {
         document.getElementById('mensagem').textContent = 'Não foi possível concluir a operação.'
         document.getElementById('mensagem').setAttribute('class', 'alert alert-danger')

         var divMensagemErro
         var erros = data.erro
         $('#mensagemErros').empty()
         for (var i = 0; i < erros.length; i++) {
         $('#mensagemErros').append("<div class='alert alert-danger'>" + erros[i] + "</div>" + "<br/>")
         console.log(erros[i])
         }

         $('#mensagemModal').modal('show')
         } else {
         document.getElementById('mensagem').textContent = 'Cadastro realizado com sucesso.'
         document.getElementById('mensagem').setAttribute('class', 'alert alert-success')
         $('#mensagemErros').empty()
         $('#mensagemModal').modal('show')
         $('input').val('')
         $('select').val('0')
         }
         }
         */
    </script>

</body>

</html>