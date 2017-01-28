<div class="row">
    <div class="col-xs-12 col-md-12 text-center">
        <h4>Avaliação dos eleitores</h4>
        <h1 class="rating-num">
            <g:formatNumber number="${resposta.media}" type="number" maxFractionDigits="2"/>
        </h1>

        <div class="rating">
            <g:each in="${[0, 1, 2, 3, 4]}" var="i">
                <g:if test="${i < (int) resposta.media}">
                    <span class="fa fa-star"></span>
                </g:if>
                <g:else>
                    <span class="fa fa-star-o"></span>
                </g:else>
            </g:each>
        </div>

        <div>
            <span class="fa fa-user"></span> ${resposta.quantidade.sum()}
        </div>
    </div>

    <div class="col-xs-12 col-md-11">
        <div class="row rating-desc">
            <g:each status="i" in="${resposta.porcentagem}" var="porcentagem">
                <div class="col-xs-2 col-md-2 text-right">
                    ${resposta.nota.getAt(i)} <span class="fa fa-star"></span>
                </div>

                <div class="col-xs-10 col-md-10">
                    <div class="progress">
                        <div class="progress-bar progress-bar" role="progressbar" aria-valuenow="80"
                             aria-valuemin="0" aria-valuemax="100" style="width: ${porcentagem}%">
                            <span class="sr-only">
                                <g:formatNumber number="${porcentagem}" type="number" maxFractionDigits="2"/>%
                            </span>
                        </div>
                    </div>
                </div>
            </g:each>
        </div>
    </div>
</div>
