function contadorCaracteres(idCampo, idContador) {
    var tagContador = $(idContador)
    var conteudoCampo = $(idCampo).val()
    tagContador.text(conteudoCampo.length)
}

function validarEmail(login_email) {

    $.ajax({
        url: "/Politica/Eleitor/validarEmail/",
        data: {
            email: login_email
        },
        method: "post",
        success: function (data) {
            exibirMensagemGenericaValidacao(data, data.mensagem, false, '#email')
        }
    })
}

function validarPreenchimento(inputId,  divId) {
    var input = document.getElementById(inputId);
    if(input.checkValidity()){
        $(divId).removeClass('has-error');
        $(divId).addClass('has-success');
    }else {
        $(divId).removeClass('has-success');
        $(divId).addClass('has-error');
    }

}

function validarSelect(selectId, divId) {
    var select = document.getElementById(selectId);
    if(select.checkValidity()){
        select.style.borderColor = '#3C763D';
    }else {
        select.style.borderColor = '#A94442';
    }

}

function exibirMensagemGenericaValidacao(data, mensagemSucesso, isLimpar, divId) {
    if (data.erro) {
        var erro = data.erro
        $.notify(erro, "error", {autoHideDelay: 15000});
        $(divId).removeClass('has-success')
        $(divId).addClass('has-error')


    } else {
        $.notify(mensagemSucesso, "success");
        $(divId).removeClass('has-error');
        $(divId).addClass('has-success')
        if (isLimpar) {
            limparCampos()
        }
    }


}