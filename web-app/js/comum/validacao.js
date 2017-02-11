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


function validarPreenchimentoForm() {

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