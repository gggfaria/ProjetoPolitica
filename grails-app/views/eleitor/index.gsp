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
    <meta name="layout" content="main">

</head>

<body>

    <h2>Cadstrar-se</h2>
    <hr/>
<g:formRemote name="formEleitor" url="[controller:'eleitor', action:'cadastrar']" onSuccess="exibirMensagem(data)">
    <div class="row">
        <div class="col-md-12" style="margin-left: 25px">
            <div class="row">
                <div class="col-md-6">
                    <label>Nome</label>
                    <input type="text" name="nome" class="form-control">
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <label>Data de nascimento</label>
                    <input type="date" name="dataNascimento" class="form-control">
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <label>E-mail</label>
                    <input type="email" name="email" class="form-control">
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <label>Senha</label>
                    <input type="password" name="senha" class="form-control">
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">

                    <label>Sexo</label>

                    <select name="sexo" class="form-control">
                        <option value="0">Selecione</option>
                        <option value="MASCULINO">Masculino</option>
                        <option value="FEMININO">Feminino</option>
                        <option value="OUTROS">Outros</option>
                    </select>
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



</g:formRemote>


<script>
    function exibirMensagem(data) {
        if(data.erro){
            alert("Erro")
        }else {
            alert("OK")

        }
    }

</script>
<script type="text/javascript" src="../js/select.js"></script>
</body>
</html>