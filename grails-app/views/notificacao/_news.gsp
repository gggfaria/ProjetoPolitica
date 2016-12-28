<div class="col-md-12" style="overflow-y: scroll; height:300px;">

 <li class="col-lg-offset-7">
<button id="deletar" type='button' onclick="limparNotificacoes()" class='btn btn-primary col-lg-offset-6'  title='Limpar notificações'>Limpar</button> </li>
                        <hr>
<g:each in="${listaNotificacoes}" var="notificacao">
    <g:if test="${notificacao.isVisualizada}">
        <div class="panel-body" style="background-color: #ffffff">
       <i class="fa fa-envelope-o" aria-hidden="true"></i>
    </g:if>
    <g:else>
        <div class="panel-body" style="background-color:#ecf0f1">


      <i class="fa fa-envelope-o" aria-hidden="true"></i>
    </g:else>

    <button type="button" onclick="excluirNotificacao(${notificacao.id})" class="close">
        <span style="background-color: transparent" aria-hidden="true">&times;</span></button>
    <li>

            <div class="pull-left">
            </div>
            <h4>
                ${notificacao.titulo}
            </h4>

            <p>${notificacao.descricao}<g:link controller="proposta" action="pergunta" id="${notificacao.caminho}">Clique aqui para interagir"</g:link></p>

        <small><i class="fa fa-clock-o"></i> ${notificacao.dataHora.format("dd/MM/yyyy hh:mm")}</small>

    </li>
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
                excluirMensagem(data)
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



