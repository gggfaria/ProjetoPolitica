<div class="col-md-12" style="overflow-y: scroll; height:300px;">

    <li class="col-lg-offset-7">
<g:submitButton name="deletar" value="Limpar" type='button' onclick="limparNotificacoes()"
                class='btn btn-primary col-lg-offset-6'
                title='Limpar notificações'></g:submitButton></li>
<hr>
<g:each in="${listaNotificacoes}" var="notificacao">
    <g:if test="${notificacao.isVisualizada}">
        <div class="panel-body" >
      <i class="fa fa-folder-open-o fa-2x" aria-hidden="true"></i>
    </g:if>
    <g:else>
        <div class="panel-body" style="background-color:#ecf0f1">

     <i class="fa fa-folder-o fa-2x" aria-hidden="true"></i>
    </g:else>
    <span name="deletar${notificacao.id}" class="close"
          onclick="excluirNotificacao(${notificacao.id})">
        <i class="fa fa-times" aria-hidden="true"></i>
    </span>

    <li>
        <h4>
            ${notificacao.titulo}
        </h4>

        <sec:ifAllGranted roles="ROLE_POLITICO">
            <g:link class="link" onclick="visualizarNotificacao(${notificacao.id})"
                    controller="pergunta"
                    action="responder"
                    id="${notificacao.caminho}">
               ${notificacao.descricao}
            </g:link>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="ROLE_ELEITOR">
            <p>${notificacao.descricao}<g:link onclick="visualizarNotificacao(${notificacao.id})"
                                               controller="proposta"
                                               action="detalhes"
                                               id="${notificacao.caminho}"><br>Clique aqui para interagir</g:link>
            </p>
        </sec:ifAllGranted>
    </li>
    <small><i class="fa fa-clock-o"></i> ${notificacao.dataHora.format("dd/MM/yyyy hh:mm")}</small>
    </div>
    <hr>

</g:each>
</div>

<script>
    function limparNotificacoes() {
        $.ajax({
            url: "/Politica/notificacao/limpar/",

            method: "post",
            success: function (data) {
                exibirMensagemGenerica(data, "Todas notificações marcadas como visualizadas", false)
                carregarNotificacoes()
            }
        })

    }

    function visualizarNotificacao(id) {
        $.ajax({
            url: "/Politica/notificacao/visualizar/" + id,
            data: {
                id: id
            },
            method: "post",
            success: function (data) {
                carregarNotificacoes()
            }
        })

    }

    function excluirNotificacao(id) {
        $.ajax({
            url: "/Politica/notificacao/excluir/" + id,
            data: {
                id: id
            },
            method: "post",
            success: function (data) {
                carregarNotificacoes()
            }
        })

    }


    function carregarNotificacoes() {

        $.ajax({
            url: "/Politica/notificacao/listar/",
            method: "post",
            success: function (data) {
            }
        })

    }


</script>



