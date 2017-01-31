<g:each in="${areas}" var="area">
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

            <div id="collapse${area?.nome.replaceAll(" ", "")}" class="panel-collapse collapse" style="margin: 5px">
                <g:each in="${propostas?.findAll { p -> p.area.nome.equals(area.nome) }}" var="proposta">
                    <div class='panel panel-default'>
                        <div class='panel-heading'>
                            <h3 class='panel-title'>
                                ${proposta.titulo}
                            </h3>
                        </div>

                        <div class='panel-body'>
                            ${proposta.resumo}
                        </div>

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
                </g:each>
            </div>
        </div>

    </div>

</g:each>