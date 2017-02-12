<g:formRemote name="formEleitor" url="[controller:'eleitor', action:'cadastrar']"
              onSuccess="exibirMensagemGenerica(data, 'Cadastro realizado com sucesso', true)" class="form-group">
    <div class="row">
        <div class="col-md-12" style="margin-left: 25px">
            <div class="row">
                <div class="col-md-10">
                    <span class="obrigatorio">*</span>
                    <label>Nome completo</label>
                    <div class="input-group" id="divNome">
                        <span class="input-group-addon">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </span>
                        <input type="text" name="nome" placeholder="Nome" onblur="validarPreenchimento(this.id, '#divNome')"
                               id="nome" required="" class="form-control">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-10">
                    <span class="obrigatorio"> * </span>
                    <label>Data de nascimento</label>
                    <div class="input-group" id="divDataNascimento">
                        <span class="input-group-addon">
                            <i class="fa fa-calendar" aria-hidden="true"></i>
                        </span>
                        <input type="text" name="dataNascimento" placeholder="dd/mm/aaaa"  id="dataNascimento" required=""
                               onchange="validarPreenchimento(this.id, '#divDataNascimento')" class="form-control">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-10">
                    <span class="obrigatorio">*</span>
                    <label>E-mail</label>
                    <div class="input-group" id="email">
                        <span class="input-group-addon">@</span>
                        <input type="email" id="nome_cadastro" name="j_username"  placeholder="E-mail"  required="" class="form-control">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-10">
                    <span class="obrigatorio">*</span>
                    <label>Senha</label>
                    <div class="input-group" id="divSenha">
                        <span class="input-group-addon">
                            <i class="fa fa-key" aria-hidden="true"></i>
                        </span>
                        <input type="password" onblur="validarPreenchimento(this.id, '#divSenha')" min="5" name="j_password" id="senha"  placeholder="Senha"  required="" class="form-control">
                        <span class="input-group-addon" style="cursor: pointer;" onmousedown="exibirSenha()" onmouseup="esconderSenha()">
                            <i class="fa fa-eye" aria-hidden="true"></i>
                        </span>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-md-10">
                    <span class="obrigatorio">*</span>
                    <label>Sexo</label>
                    <div class="input-group" id="divSexo">
                        <span class="input-group-addon">
                            <i class="fa fa-venus-mars" aria-hidden="true"></i>
                        </span>
                        <select name="sexo" class="form-control" required="" id="selectSexo"
                                onchange="validarPreenchimento(this.id, '#divSexo')">
                            <option value="">Selecione</option>
                            <option value="MASCULINO">Masculino</option>
                            <option value="FEMININO">Feminino</option>
                            <option value="OUTROS">Outros</option>
                        </select>
                    </div>

                </div>
            </div>


            <!--<div class="row">
            <div class="col-md-6">

                <a class="btn btn-default btn-select">
                    <input type="hidden" class="btn-select-input" id="" name="" value="" />
                    <span class="btn-select-value">Select an Item</span>
                    <span class='btn-select-arrow glyphicon glyphicon-chevron-down'></span>
                    <ul>
                        <li>Option 1</li>
                        <li class="selected">Option 2</li>
                        <li>Option 3</li>
                        <li>Option 4</li>
                    </ul>
                </a>
            </div>
        </div>-->

        <button class="button button-5 button-5b icon-cart" name="cadastrar">
            <i class="fa fa-check"></i>
            <span>Cadastrar</span>
        </button>



        </div>
    </div>

    <br/>
</g:formRemote>

<script type="text/javascript" src="/Politica/js/comum/validacao.js"></script>
<script>
    $(document).ready(function() {

        $('#nome_cadastro').on('blur',function () {
            var email_login = $('#nome_cadastro').val()
            validarEmail(email_login)
        })
        $('#divDataNascimento').removeClass('has-error');
    })



</script>


