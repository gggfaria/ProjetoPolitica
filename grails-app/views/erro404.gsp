<%--
  Created by IntelliJ IDEA.
  User: Willian
  Date: 14/11/2016
  Time: 15:40
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Página não encontrada</title>
    <meta name="layout" content="main">
</head>

<body>

<div class="container-fluid">
    <h2>Recurso pretendido não encontrado</h2>
    <hr/>

    <p>${mensagem ? mensagem : 'Recurso pretendido não encontrado'}</p>
</div>

</body>
</html>