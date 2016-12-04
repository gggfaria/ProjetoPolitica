<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Eleitor - home</title>
    <link href="/Politica/css/select.css" rel="stylesheet">
    <link href="/Politica/css/bootstrap-datepicker.css" rel="stylesheet">


    <meta name="layout" content="main">

</head>

<body>
<div class="container-fluid">
    <h1>Meus dados</h1>
    <hr/>

    <label>Nome:</label>
    <span> ${pessoa?.nome}s</span>
    <br/>

    <label>Data de nascimento:</label>
    <span> ${pessoa?.dataNascimento.format("dd/MM/yyyy")}</span>

    <br/>

    <label>E-mail:</label>
    <span> ${pessoa?.email}</span>
    <br/>

    <label>Sexo:</label>
    <spam style="text-transform: lowercase"> ${pessoa?.sexo}</spam><br/>

</div>

</body>
</html>