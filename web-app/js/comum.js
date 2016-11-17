/**
 * Created by Gabriel on 14/11/2016.
 */

function exibirSenha()
{
    $("#senha").attr("type", "text");
}

function esconderSenha()
{
    $("#senha").attr("type", "password");
}




//funcao de exibir mensagem de erro em modal
function exibirMensagem(data) {
    if(data.erro){


        var erros = data.erro
        $('#mensagemErros').empty()
        for(var i=0; i < erros.length; i++){
            $.notify(erros[i], "error");
            console.log(erros[i])
        }
        $.notify("Não foi possível concluir a operação", "error");

    }else {
        $.notify("Cadastro realizado com sucesso", "success");
        $('input').val('')
        $('select').val('0')
        $('#modalForm').modal('hide')
    }
}

//funcao de exibir mensagem de erro em modal
function exibirMensagemModal(data) {
    if(data.erro){
        document.getElementById('mensagem').textContent = 'Não foi possível concluir a operação.'
        document.getElementById('mensagem').setAttribute('class','alert alert-danger')

        var divMensagemErro
        var erros = data.erro
        $('#mensagemErros').empty()
        for(var i=0; i < erros.length; i++){
            $('#mensagemErros').append("<div class='alert alert-danger'>"+erros[i]+"</div>"+"<br/>")
            console.log(erros[i])
        }

        $('#mensagemModal').modal('show')
    }else {
        document.getElementById('mensagem').textContent = 'Cadastro realizado com sucesso.'
        document.getElementById('mensagem').setAttribute('class','alert alert-success')
        $('#mensagemErros').empty()
        $('#mensagemModal').modal('show')
        $('input').val('')
        $('select').val('0')
    }
}