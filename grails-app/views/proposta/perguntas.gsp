<g:each in="${perguntas}" var="pergunta">

    <div class="col-md-10" id="perguntasAntigas">
        <div class="col-sm-6">
            <div class="testimonial testimonial-default">
                <div class="testimonial-section">
                    ${pergunta.descricao}
                </div>

                <div class="testimonial-desc">

                    <div class="testimonial-writer">
                        <div class="testimonial-writer-name">${pergunta.pessoa.nome}</div>

                        <div class="testimonial-writer-designation">${pergunta.data.format("dd/MM/yyyy hh:mm")}</div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <g:if env="pergunta.resposta!=null">

        <div class="col-md-10" id="perguntasAntigas">
            <div class="col-sm-6">
                <div class="testimonial testimonial-primary">
                    <div class="testimonial-section">
                        ${pergunta.resposta?.descricao}
                    </div>

                    <div class="testimonial-desc">

                        <div class="testimonial-writer">
                            <div class="testimonial-writer-name">${pergunta.resposta.politico?.nome}</div>

                            <div class="testimonial-writer-designation">${pergunta.resposta?.data?.format("dd/MM/yyyy hh:mm")}</div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </g:if>

</g:each>