<label>Quantidade de notificações</label>
${listaNotificacoes?.size()}
<g:each in="${listaNotificacoes}" var="notificacao">

    <div class="panel-group" id="accordion${notificacao.id}">
        <div class="panel panel-primary" aria-expanded="false">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <i class="fa ${notificacao.data}" aria-hidden="true"></i>
    <a data-toggle="collapse" data-parent="#accordion" href="#collapse${notificacao.titulo.replaceAll(" ", "")}"
       aria-expanded="false">
        ${notificacao.descricao}
    </a>
    </h4>
</div>
    </div>
       </g:each>
