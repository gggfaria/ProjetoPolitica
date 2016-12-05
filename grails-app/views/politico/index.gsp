<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Index</title>
    <meta name="layout" content="main">

</head>

<body>

<div class="container-fluid">
    <h1>Perguntas de eleitores</h1>
    <hr/>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Eleitor</th>
            <th>Proposta</th>
            <th>Data</th>
            <th>Respondida?</th>
            <th>Ação</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${perguntas}" var="pergunta">
            <tr>
                <td>
                    ${pergunta.pessoa.nome}
                </td>
                <td>${pergunta.proposta.titulo}</td>
            <td>${pergunta.data.format("dd/MM/yyyy")}
                <g:if test="${pergunta.isRespondida}">
                    <td title="Está repondida">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Sim
                    </td>

                </g:if>
                <g:else>
                    <td title="Não está repondida">
                        <i class="fa fa-times" aria-hidden="true"></i>
                        Não
                    </td>
                </g:else>
                <td>
                    <g:if test="${pergunta.isRespondida}">
                        <g:link id="${pergunta.id}" title="Editar resposta">
                            Editar
                        </g:link>

                    </g:if>
                    <g:else>
                        <g:link controller="pergunta" action="responder" id="${pergunta.id}"
                                title="Responder à pergunta">
                            Responder
                        </g:link>
                    </g:else>

                </td>
            </tr>
        </g:each>

        </tbody>
    </table>
</div>

</body>
</html>

