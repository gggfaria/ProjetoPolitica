/**
 * Created by Gabriel on 14/11/2016.
 */

function exibirSenha() {
    $("[name='j_password']").attr("type", "text");
}

function esconderSenha() {
    $("[name='j_password']").attr("type", "password");
}


//funcao de exibir mensagem de erro em modal
function exibirMensagem(data) {
    if (data.erro) {


        var erros = data.erro
        console.log(erros)
        $('#mensagemErros').empty()
        for (var i = 0; i < erros.length; i++) {
            $.notify(erros[i], "error", {autoHideDelay: 15000});
            console.log(erros[i])
        }

        $.notify("Não foi possível concluir a operação", "error", {autoHideDelay: 15000});

    } else {
        $.notify("Cadastro realizado com sucesso", "success");
        $("input[type=text]").val('')
        $('textarea').val('')
       // $('select').val('0')
        $('#modalForm').modal('hide')
    }
}

function exibirUpdate(data) {
    if (data.erro) {


        var erros = data.erro
        console.log(erros)
        $('#mensagemErros').empty()
        for (var i = 0; i < erros.length; i++) {
            $.notify(erros[i], "error", {autoHideDelay: 15000});
            console.log(erros[i])

        }

        $.notify("Não foi possível concluir a operação", "error", {autoHideDelay: 15000});

    } else {
        $.notify("Dados atualizados com sucesso", "success");
        $("input[type=text]").val('')
        $('textarea').val('')
        $('#modalForm').modal('hide')
    }
}


//funcao de exibir mensagem de erro em modal
function exibirMensagemModal(data) {
    if (data.erro) {
        document.getElementById('mensagem').textContent = 'Não foi possível concluir a operação.'
        document.getElementById('mensagem').setAttribute('class', 'alert alert-danger')

        var divMensagemErro
        var erros = data.erro
        $('#mensagemErros').empty()
        for (var i = 0; i < erros.length; i++) {
            $('#mensagemErros').append("<div class='alert alert-danger'>" + erros[i] + "</div>" + "<br/>")
            console.log(erros[i])
        }

        $('#mensagemModal').modal('show')
    } else {
        document.getElementById('mensagem').textContent = 'Cadastro realizado com sucesso.'
        document.getElementById('mensagem').setAttribute('class', 'alert alert-success')
        $('#mensagemErros').empty()
        $('#mensagemModal').modal('show')
        $('input').val('')
        $("input[type=text]").val('')
        $('select').val('0')
    }
}


//funcao de exibir mensagem de sucesso adicionar pergunta, recebe o id da proposta
function exibirMensagemAdicionarPergunta(data, id) {
    if (data.erro) {
        var erros = data.erro
        console.log(erros)
        $('#mensagemErros').empty()
        for (var i = 0; i < erros.length; i++) {
            $.notify(erros[i], "error", {autoHideDelay: 15000});
            console.log(erros[i])
        }

        $.notify("Não foi possível concluir a operação", "error", {autoHideDelay: 15000});


    } else {
        $.notify("Pergunta enviada com sucesso", "success");
        $('textarea').val('')
        $("input[type=text]").val('')
        atualizarPerguntas(id)

    }
}


//funcao de exibir mensagem de sucesso adicionar pergunta, recebe o id da proposta
function exibirMensagemGenerica(data, mensagemSucesso, isLimpar) {
    if (data.erro) {
        var erros = data.erro
        console.log(erros)
        $('#mensagemErros').empty()
        for (var i = 0; i < erros.length; i++) {
            $.notify(erros[i], "error", {autoHideDelay: 15000});
            console.log(erros[i])
        }

        $.notify("Não foi possível concluir a operação", "error", {autoHideDelay: 15000});


    } else {
        $.notify(mensagemSucesso, "success");
        if (isLimpar) {
            limparCampos()
        }

    }
}

function limparCampos() {
    $('input').val('')
    $('textarea').val('')
}



