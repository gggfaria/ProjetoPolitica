<%--
  Created by IntelliJ IDEA.
  User: Gabriel
  Date: 07/11/2016
  Time: 22:09
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Eleitor - Cadastro</title>
    <link href="/Politica/css/select.css" rel="stylesheet">
    <link href="/Politica/css/bootstrap-datepicker.css" rel="stylesheet">




    <meta name="layout" content="main">


</head>

<body>



<div class="container-fluid">
    <h2>Cadastrar-se</h2>
    <hr/>
<g:formRemote name="formEleitor" url="[controller:'eleitor', action:'cadastrar']" onSuccess="exibirMensagem(data)" class="form-group">
    <div class="row">
        <div class="col-md-12" style="margin-left: 25px">
            <div class="row">
                <div class="col-md-6">
                    <span class="obrigatorio">*</span>
                    <label>Nome completo</label>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </span>
                        <input type="text" name="nome"  placeholder="Nome"  required="" class="form-control">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <span class="obrigatorio"> * </span>
                    <label>Data de nascimento</label>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-calendar" aria-hidden="true"></i>
                        </span>
                        <input type="date" name="dataNascimento" placeholder="dd/mm/yyyy"  id="dataNascimento"  class="form-control">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <span class="obrigatorio">*</span>
                    <label>E-mail</label>
                    <div class="input-group">
                        <span class="input-group-addon">@</span>
                        <input type="email" name="email"  placeholder="email"   required="" class="form-control">
                   </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <span class="obrigatorio">*</span>
                    <label>Senha</label>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-key" aria-hidden="true"></i>
                        </span>
                        <input type="password" min="5" name="senha" id="senha"  placeholder="senha"  required="" class="form-control">
                        <span class="input-group-addon" style="cursor: pointer;" onmousedown="exibirSenha()" onmouseup="esconderSenha()">
                            <i class="fa fa-eye" aria-hidden="true"></i>
                        </span>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <span class="obrigatorio">*</span>
                    <label>Sexo</label>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-venus-mars" aria-hidden="true"></i>
                        </span>
                        <select name="sexo" class="form-control" required="">
                            <option value="0">Selecione</option>
                            <option value="MASCULINO">Masculino</option>
                            <option value="FEMININO">Feminino</option>
                            <option value="OUTROS">Outros</option>
                        </select>
                    </div>

                </div>
            </div>


        <!--<div class="row">
            <div class="col-md-6">

                <a class="btn btn-default btn-select">
                    <input type="hidden" class="btn-select-input" id="" name="" value="" />
                    <span class="btn-select-value">Select an Item</span>
                    <span class='btn-select-arrow glyphicon glyphicon-chevron-down'></span>
                    <ul>
                        <li>Option 1</li>
                        <li class="selected">Option 2</li>
                        <li>Option 3</li>
                        <li>Option 4</li>
                    </ul>
                </a>
            </div>
        </div>-->


            <button class="button button-3 button-3e icon-arrow-right" name="cadastrar">
                <i class="fa fa-arrow-right"></i>
                Cadastrar
            </button>


        </div>
    </div>

    <br/>


    <div class="modal fade" tabindex="-1" role="dialog" id="mensagemModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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
<script type="text/javascript" src="../js/bootstrap-datepicker.js"></script>
<script>

    $.fn.datepicker.defaults.format = "mm/dd/yyyy";
    $('#dataNascimento').datepicker({
        format: "dd/mm/yyyy",
        startView: 2,
        clearBtn: true,
        language: "pt-BR",
        orientation: "bottom auto",
        autoclose: true
    });


</script>


</body>
</html>