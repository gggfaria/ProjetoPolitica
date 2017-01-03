<g:formRemote name="formProposta" url="[controller: 'proposta', action: 'atualizar']"
              onSuccess="exibirMensagemGenerica(data, 'Proposta editada com sucesso', true); carregarLista(data)"
              class="form-group">
    <g:hiddenField name="id" value="${proposta.id}"></g:hiddenField>

    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6 col-xs-12">

                <span class="obrigatorio">*</span>
                <label>Área</label>

                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="fa fa-university" aria-hidden="true"></i>
                    </span>
                    <g:select name="area" from="${areas}" id="area" class="form-control"
                              optionValue="nome" value="${proposta.area.id}"
                              optionKey="id"></g:select>
                </div>

                <span class="obrigatorio" title="Tamanho deverá estar entre 20 e 150 caracteres"
                      style="cursor: pointer">*</span>
                <label>Título</label>

                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="fa fa-bold" aria-hidden="true"></i>
                    </span>

                    <input type="text" name="titulo" value="${proposta.titulo}" placeholder="Título da proposta"
                           required=""
                           class="form-control">
                </div>

            </div>

            <div class="col-md-6 col-xs-12">
                <span class="obrigatorio" title="Tamanho deverá estar entre 50 e 255 caracteres"
                      style="cursor: pointer">*</span>
                <label>Resumo</label>


                <textarea min="5" rows="3" name="resumo" id="resumo" placeholder="Resumo"
                          required="" class="form-control"
                          oninput="contarCaracteres('#resumo', '#quantidadeDigitadaResumo')">${proposta.resumo}</textarea>

                <p><spam id="quantidadeDigitadaResumo"></spam> caracter(es) digitado(s)</p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="col-md-12">
                <br>
                <span class="obrigatorio" title="Tamanho deverá estar entre 80 e 5.000 caracteres"
                      style="cursor: pointer">*</span>
                <label>Descrição</label>

                <textarea type="text" oninput="contarCaracteres('#descricao', '#quantidadeDigitadaDescricao')"
                          id="descricao" min="5" rows="15" name="descricao" placeholder="Descrição" required=""
                          class="form-control">${proposta.descricao}</textarea>

                <p><spam id="quantidadeDigitadaDescricao"></spam> caracter(es) digitado(s)</p>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-6">
            <button class="button button-5 button-5b icon-cart" name="cadastrar">
                <i class="fa fa-check"></i>
                <span>Confirmar</span>
            </button>
        </div>
    </div>

</g:formRemote>
