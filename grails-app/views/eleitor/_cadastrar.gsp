<g:formRemote name="formEleitor" url="[controller:'eleitor', action:'cadastrar']" onSuccess="exibirMensagem(data)" class="form-group">
    <div class="row">
        <div class="col-md-12" style="margin-left: 25px">
            <div class="row">
                <div class="col-md-10">
                    <span class="obrigatorio">*</span>
                    <label>Nome completo</label>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </span>
                        <input type="text" name="nome" placeholder="Nome" id="nome" required="" class="form-control">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-10">
                    <span class="obrigatorio"> * </span>
                    <label>Data de nascimento</label>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-calendar" aria-hidden="true"></i>
                        </span>
                        <input type="date" name="dataNascimento" placeholder="dd/mm/aaaa"  id="dataNascimento"  class="form-control">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-10">
                    <span class="obrigatorio">*</span>
                    <label>E-mail</label>
                    <div class="input-group">
                        <span class="input-group-addon">@</span>
                        <input type="email" name="email"  placeholder="email"  required="" class="form-control">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-10">
                    <span class="obrigatorio">*</span>
                    <label>Senha</label>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-key" aria-hidden="true"></i>
                        </span>
                        <input type="password" min="5" name="senha" id="senha"  placeholder="senha"  required="" class="form-control">
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
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-venus-mars" aria-hidden="true"></i>
                        </span>
                        <select name="sexo" class="form-control" required="">
                            <option value="0">Selecione</option>
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


