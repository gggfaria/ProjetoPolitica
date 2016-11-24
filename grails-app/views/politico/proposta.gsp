<g:each in="${resposta.areas}" var="area">
    <div class="panel-group" id="accordion${area.id}">
        <div class="panel panel-primary" aria-expanded="false">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <i class="fa ${area.icone}" aria-hidden="true"></i>
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse${area.nome}" aria-expanded="false">
                        ${area.nome}
                    </a>
                </h4>
            </div>
            <g:each in="${resposta.propostas.findAll{p -> p.area.nome.equals(area.nome)}}" var="proposta">
                <div id="collapse${area.nome}" class="panel-collapse collapse" style="margin: 5px">
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

                            <button type='button' class='btn btn-default'
                                    onclick='redirecionarPerguntaProposta(${proposta.id})'
                                    title='Faça uma pergunta sobre o assunto'>Questione <i class='fa fa-comment'
                                                                                           aria-hidden='true'></i>
                            </button>
                        </div>
                    </div>
                </div>
            </g:each>

        </div>

    </div>

</g:each>

