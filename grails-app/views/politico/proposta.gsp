<g:each in="${resposta.areas}" var="area">
    <div class="panel-group" id="accordion${area.id}">
        <div class="panel panel-primary" aria-expanded="false">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <i class="fa ${area.icone}" aria-hidden="true"></i>
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse${area.nome.replaceAll(" ", "")}"
                       aria-expanded="false">
                        ${area.nome}
                    </a>
                </h4>
            </div>
            <g:each in="${resposta.propostas.findAll { p -> p.area.nome.equals(area.nome) }}" var="proposta">
                <div id="collapse${area.nome.replaceAll(" ", "")}" class="panel-collapse collapse" style="margin: 5px">
                    <div class='panel panel-default'>
                        <div class='panel-heading'>
                            <h3 class='panel-title'>
                                ${proposta.titulo}
                            </h3>
                        </div>

                        <!--  <div class='panel-body'>
                            ${raw(proposta.resumo)}
                            <button id="exibir${proposta.id}" type='link' class='btn btn-primary col-lg-offset-10'
                                    onclick="exibirDescricao(${proposta.id})"
                                    title='Exibir Descrição'>
                                Saiba mais !

                            </button>

                            <div id="descricao${proposta.id}" style="display: none">
                                <div class='panel-heading'>
                                    <h4 style="color: #ffffff" class='label-primary text-center''>
                                Descrição da proposta ${proposta.titulo}
                                </h4>
                                </div>
                                ${raw(proposta.descricao)}
                            </div>
                        </div>
                        -->
                        <div class='panel-footer'>
                            <sec:ifAllGranted roles="ROLE_ELEITOR">
                                <button type='button' class='btn btn-primary'
                                        onclick='redirecionarPerguntaProposta(${proposta.id})'
                                        title='Faça uma pergunta sobre o assunto'>
                                    <i class='fa fa-comment' aria-hidden='true'></i>
                                    Questione
                                </button>

                            </sec:ifAllGranted>

                            <button type='button' class='btn btn-primary'
                                    onclick='redirecionarPerguntaProposta(${proposta.id})'
                                    title='Visualizar mais informações sobre a proposta'>
                                <i class='fa fa-plus' aria-hidden='true'></i>
                                Ver detalhes
                            </button>

                        </div>
                    </div>
                </div>
            </g:each>

        </div>

    </div>

</g:each>
<script>
    function exibirDescricao(id) {
        if ($('#descricao' + id).is(":visible") == false) {
            $('#descricao' + id).show(500)
            $('#exibir' + id).text("Ocultar descrição")
        } else {
            $('#descricao' + id).hide(500)
            $('#exibir' + id).text("Saiba mais !")
        }
        // document.getElementById('descricao'+id)
        //alert('descricao'+id)
    }
</script>


