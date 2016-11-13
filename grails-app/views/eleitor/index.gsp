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
    <meta name="layout" content="main">
</head>

<body>

    <h2>Cadstrar-se</h2>
    <hr/>
<g:formRemote name="formEleitor" url="[controller:'eleitor', action:'cadastrar']" onSuccess="exibirMensagem(data)">
    <div style="margin: 25px">
        <label>Nome</label>
        <input type="text" name="nome" class="form-control">
        <br/>
        <label>Data de nascimento</label>
        <input type="date" name="dataNascimento" class="form-control">
        <br/>
        <label>E-mail</label>
        <input type="email" name="email" class="form-control">
        <br/>
        <label>Senha</label>
        <input type="password" name="senha" class="form-control">
        <br/>
        <label>Sexo</label>

        <select name="sexo" class="form-control">
            <option value="0">Selecione</option>
            <option value="MASCULINO">Masculino</option>
            <option value="FEMININO">Feminino</option>
            <option value="OUTROS">Outros</option>
        </select>
    </div>

    <br/>
    <input type="submit" name="cadastrar" value="Cadastrar"/>


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

</body>
</html>