<%--
  Created by IntelliJ IDEA.
  User: Gabriel
  Date: 27/11/2016
  Time: 22:29
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Logar</title>
    <meta name="layout" content="main">

</head>

<body>
<div class="container-fluid">
    <div class="col-md-offset-4">
        <form action='${request.contextPath}/j_spring_security_check' method='POST' id='frmLogar' name='frmLogar'>
            <div class="row">
                <div class="col-md-6">
                    <span class="obrigatorio">*</span>
                    <label>E-mail</label>

                    <div class="input-group">
                        <span class="input-group-addon">@</span>
                        <input type="email" name="j_username"
                               placeholder="email" required="" class="form-control">
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
                        <input type="password" min="5" name="j_password" id="senha" placeholder="senha" required=""
                               class="form-control">
                        <span class="input-group-addon" style="cursor: pointer;" onmousedown="exibirSenha()"
                              onmouseup="esconderSenha()">
                            <i class="fa fa-eye" aria-hidden="true"></i>
                        </span>
                    </div>

                </div>
            </div>
            <br/>

            <div class="row">
                <div class="col-md-6">
                    <g:if test="${error=='1'}">
                        <div class="alert alert-danger">
                            <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                            Erro ao logar no sistema, tente novamente.<br/>

                        </div>
                    </g:if>
                </div>
            </div>

            <button class="button button-5 button-5b icon-cart" name="cadastrar">
                <i class="fa fa-arrow-right"></i>
                <span>Acessar</span>
            </button>
        </form>

    </div>
</div>
<script>

</script>
</body>
</html>