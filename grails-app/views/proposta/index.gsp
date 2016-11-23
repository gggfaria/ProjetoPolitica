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
    <g:formRemote name="formProposta" url="[controller: 'proposta', action: 'salvar']" onSuccess="exibirMensagem(data)"
                  class="form-group">
        <div class="row">
            <div class="col-md-12" style="margin-left: 25px">
                <div class="row">
                    <div class="col-md-6">
                        <span class="obrigatorio">*</span>
                        <label>Politico</label>

                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </span>
                            <g:select name="politico" from="${listaPoliticos}" optionValue="nome" optionKey="id"
                                      class="form-control"></g:select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <span class="obrigatorio">*</span>
                        <label>Area</label>

                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-university" aria-hidden="true"></i>
                            </span>
                            <g:select name="area" from="${listaAreas}" class="form-control" optionValue="nome"
                                      optionKey="id"></g:select>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <span class="obrigatorio">*</span>
                        <label>Titulo</label>

                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-hashtag" aria-hidden="true"></i>
                            </span>

                            <input type="text" name="titulo" placeholder="Titulo" required="" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-11">
                        <span class="obrigatorio">*</span>
                        <label>Resumo</label>

                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-align-left" aria-hidden="true"></i>
                            </span>
                            <textarea type="text" min="5" rows="3" name="resumo" id="resumo" placeholder="resumo"
                                      required="" class="form-control">
                            </textarea>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-11">
                        <span class="obrigatorio">*</span>
                        <label>Descrição</label>

                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-list" aria-hidden="true"></i>
                            </span>
                            <textarea type="text" min="5" rows="15" name="descricao" placeholder="Descricao" required=""
                                      class="form-control">
                            </textarea>
                        </div>

                    </div>
                </div>

                <div class="form-inline">
                    <div class="form-group">
                        <a class="button button-2 button-3e icon-arrow-left" name="cancelar" href="http://localhost:8080/Politica">
                            <i class="fa fa-arrow-left"></i>
                            Cancelar
                        </a>
                    </div>

                    <div class="form-group">
                        <button class="button button-3 button-3e icon-arrow-right" name="cadastrar">
                            <i class="fa fa-arrow-right"></i>
                            Cadastrar
                        </button>
                    </div>
                </div>

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
</div>

<script type="text/javascript" src="../js/select.js"></script>
<script type="text/javascript" src="../js/comum.js"></script>
<script type="text/javascript" src="../js/nicEdit.js"></script>
<script type="text/javascript">
    //<![CDATA[
    bkLib.onDomLoaded(function () {
        nicEditors.allTextAreas()
    });
    //]]>
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