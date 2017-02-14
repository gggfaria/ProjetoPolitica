<g:each in="${perguntas}" var="pergunta">
    <div class="row">
        <div class="col-md-12">
            <div class="testimonial testimonial-default">
                <a id="ask${pergunta.id}"></a>

                <div class="testimonial-section">
                    ${pergunta.descricao}
                </div>

                <div class="testimonial-desc">

                    <div class="testimonial-writer">
                        <div class="testimonial-writer-name" id="${pergunta?.id}">${pergunta.pessoa.nome}</div>

                        <div class="testimonial-writer-designation">${pergunta.data.format("dd/MM/yyyy hh:mm")}</div>

                    </div>
                </div>
            </div>
        </div>
        <g:if test="${exibirResposta == true && pergunta.resposta == null}">
            <div class="form-inline">
                <div class="form-group">
                    <div class="col-md-12" id="enviar${pergunta.id}">
                        <button class="button button-5 button-5b icon-cart" name="enviar"
                                onclick="exibirForm(${pergunta.id})">
                            <i class="fa fa-reply" aria-hidden="true"></i>
                            <span>responder</span>
                        </button>
                    </div>
                </div>
            </div>

            <div id="pergunta${pergunta.id}" class="panel-collapse collapse" style="margin: 5px">
                <g:formRemote name="formResposta" url="[controller: 'resposta', action: 'salvar']" class="form-group"
                              onSuccess="exibirMensagemAdicionarPergunta(data,${pergunta.proposta.id})">
                    <input type="hidden" name="perguntaId" value="${pergunta?.id}"/>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="obrigatorio">*</span>
                            <label>Responder para ${pergunta.pessoa.nome}:</label>
                            <textarea id="descricao${pergunta.id}" name="descricao" class="form-control"
                                      rows="5"
                                      placeholder="Digite sua resposta aqui..."
                                      style="max-width: 100%;"></textarea>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-inline">
                            <div class="form-group">
                                <button class="button button-5 button-5b icon-cart" name="enviar">
                                    <i class="fa fa-check"></i>
                                    <span>responder</span>
                                </button>
                            </div>

                            <div class="form-group">
                                <span class="button button-2 button-2e icon-cart" onclick="ocultarForm(${pergunta.id})" name="cancelar">
                                    <i class="fa fa-times"></i>
                                    <span>Cancelar</span>
                                </span>
                            </div>
                        </div>
                    </div>
                </g:formRemote>

            </div>
            <hr>
        </g:if>
    </div>
    <g:if test="${pergunta.resposta != null}">
        <div class="row">
            <div class="col-md-1"></div>

            <div class="col-md-11">
                <div class="testimonial testimonial-primary">
                    <a id="answer${pergunta.resposta.id}"></a>

                    <div class="testimonial-section">
                        ${pergunta.resposta?.descricao}
                    </div>

                    <div class="testimonial-desc">
                        <div class="testimonial-writer">
                            <div class="testimonial-writer-name"
                                 id="${pergunta?.id}">${pergunta.resposta?.politico?.nome}</div>

                            <div class="testimonial-writer-designation">${pergunta.resposta?.data?.format("dd/MM/yyyy hh:mm")}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </g:if>
</g:each>
<script type="text/javascript">
    // to top right away
    if (window.location.hash) scroll(0, 0);
    // void some browsers issue
    setTimeout(function () {
        scroll(0, 0);
    }, 1);

    // any position
    $(function () {

        // *only* if we have anchor on the url
        if (window.location.hash) {
            // smooth scroll to the anchor id
            $('html, body').animate({
                scrollTop: $(window.location.hash).offset().top + 'px'
            }, 1000, 'swing');
        }
    });

    function exibirForm(id) {
        $('#pergunta' + id).fadeIn();
        $('#enviar' + id).fadeOut();
        $('#descricao' + id).focus();
    }
    function ocultarForm(id) {
        $('#pergunta' + id).fadeOut();
        $('#enviar' + id).fadeIn();

    }

</script>

