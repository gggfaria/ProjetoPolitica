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
        if ( window.location.hash ) scroll(0,0);
        // void some browsers issue
        setTimeout( function() { scroll(0,0); }, 1);

        // any position
        $(function() {

            // *only* if we have anchor on the url
            if(window.location.hash) {
                // smooth scroll to the anchor id
                $('html, body').animate({
                    scrollTop: $(window.location.hash).offset().top + 'px'
                }, 1000, 'swing');
            }
        });
    </script>

