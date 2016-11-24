<g:each in="${perguntas}" var="pergunta">
    <label>${pergunta.descricao}</label></br>
    <label>${pergunta.data}</label></br>
    <label>${pergunta.pessoa.nome}</label></br>

    <hr/>
</g:each>