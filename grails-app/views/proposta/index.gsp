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

        <div class="col-md-12">

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


                <span class="obrigatorio">*</span>
                <label>Titulo</label>

                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="fa fa-hashtag" aria-hidden="true"></i>
                    </span>

                    <input type="text" name="titulo" placeholder="Titulo" required="" class="form-control">
                </div>

            </div>

            <div class="col-md-6">
                <span class="obrigatorio">*</span>
                <label>Resumo</label>


                <textarea type="text" min="5" rows="4" name="resumo" id="resumo" placeholder="resumo"
                          required="" class="form-control">
                </textarea>

            </div>

            <div class="col-md-12">
                <br>
                <span class="obrigatorio">*</span>
                <label>Descrição</label>


                <textarea type="text" min="5" rows="15" name="descricao" placeholder="Descricao" required=""
                          class="form-control">
                </textarea>

            </div>

            <div class="col-md-6">
                <button class="button button-5 button-5b icon-cart" name="cadastrar">
                    <i class="fa fa-check"></i>
                    <span>Cadastrar</span>
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
</div>



<script type="text/javascript" src="/Politica/js/nicEdit.js"></script>
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