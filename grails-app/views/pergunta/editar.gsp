<g:each in="${perguntas}" var="pergunta">

    <g:formRemote name="formPergunta" url="[controller:'pergunta', action:'atualizar']"
                  onSuccess="exibirMensagemGenerica(data, 'Pergunta editada com sucesso', true); atualizarLinha(data)"
                  class="form-group">

    <input type="hidden" name="perguntaId" value="${pergunta?.id}"/>

    <div class="row">
        <div class="col-md-12" style="margin-left: 25px">
            <div class="row">
                <div class="col-md-10">
                    <span class="obrigatorio">*</span>
                    <label>Corrigir pergunta</label>
                    <textarea name="descricao" id="descricao" class="form-control"
                              style="max-width: 100%;">${pergunta.descricao}</textarea>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-2" style="margin-left: 25px">
            <button class="button button-5 button-5b icon-cart" name="atualizar">
                <i class="fa fa-check"></i>
                <span>Enviar</span>
            </button>
        </div>
    </div>



    </g:formRemote>
</g:each>