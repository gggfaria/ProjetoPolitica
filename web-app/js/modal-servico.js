/*--
     Created by IntelliJ IDEA.
     User: Willian
     Date: 14/11/2016
     Time: 12:43
 --*/

window.ModalServico = (function () {
    return {
        exibirRespostaPadrao: exibirRespostaPadrao,
        exibirRespostaErro: exibirRespostaErro,
        showResponseSuccess: exibirRespostaSucesso,
        exibirRespostaErroPadrao: exibirRespostaErroPadrao
    };

    /**
     * @param {string} mensagem
     * @param {string} tipo
     * @param {string} divIdMensagem
     * @param {string} divIdModal
     * @param {string} divIdErro
     */
    function exibirModal(mensagem, tipo, divIdMensagem, divIdModal, divIdErro) {
        if (!divIdMensagem) {
            divIdMensagem = 'mensagem';
        }
        if (!divIdModal) {
            divIdModal = 'mensagemModal';
        }
        if (!divIdErro) {
            divIdErro = 'mensagemErros';
        }

        var divErro = $('#' + divIdErro);
        var divModal = $('#' + divIdModal);
        var divMensagem = document.getElementById(divIdMensagem);

        divMensagem.textContent = mensagem;
        divMensagem.setAttribute('class', 'alert alert-' + tipo);
        divErro.empty();

        divModal.modal('show');
    }

    /**
     * @param {string[]} Erros
     * @param {string} divIdErro
     */
    function showErrors(erro, divIdErro) {
        if (!divIdErro) {
            divIdErro = 'mensagemErros';
        }

        if (typeof erro !== 'object') {
            return console.log('Erro: ', erro);
        }

        var Erros = erro.errors;

        if (!Array.isArray(Erros)) {
            return console.log('Erro: ', erro);
        }

        var divErro = $('#' + divIdErro);

        console.log('Erros (' + (new Date()) + ') =>');

        for (var i = 0; i < Erros.length; i++) {
            divErro.append("<div class='alert alert-danger'>" + Erros[i] + "</div>" + "<br/>");
            console.log('Erro [' + i + ']', Erros[i]);
        }

        console.log();
    }

    /**
     * @param {Object} Resposta
     * @param {string} Resposta.erro
     */
    function exibirRespostaPadrao(Resposta) {
        if (!Resposta) {
            return;
        }

        if (Resposta.erro) {
            return exibirRespostaErro(Resposta.erro);
        }

        return exibirRespostaSucesso(Resposta.erro);
    }

    /**
     * @param {string[]} Erros
     * @param {string} mensagem
     * @param {string} divIdMensagem
     * @param {string} divIdModal
     * @param {string} divIdErro
     */
    function exibirRespostaErro(Erros, mensagem, divIdMensagem, divIdModal, divIdErro) {
        if (!Erros) {
            return;
        }

        showErrors(Erros);

        mensagem = mensagem || 'Não foi possível concluir a operação.';
        var type = 'danger';

        exibirModal(mensagem, type, divIdMensagem, divIdModal, divIdErro)
    }

    /**
     * @param {string} mensagem
     * @param {string} divIdMensagem
     * @param {string} divIdModal
     * @param {string} divIdErro
     */
    function exibirRespostaSucesso(mensagem, divIdMensagem, divIdModal, divIdErro) {
        mensagem = mensagem || 'Cadastro realizado com sucesso.';
        var type = 'success';

        exibirModal(mensagem, type, divIdMensagem, divIdModal, divIdErro)
    }

    /**
     * @param {Object} Resposta
     * @param {number} Resposta.status
     */
    function exibirRespostaErroPadrao(Resposta) {
        if (!Resposta || typeof Resposta !== 'object') {
            return;
        }

        if (Resposta.status === 404) {
            exibirModal('Ação não reconhecida ', 'warning');
        }
    }
})();