package politica

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured


@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class NotificacaoController {
    transient springSecurityService
    def notificacaoService
    def index() {
        render(view: "_news")
    }


    def salvar() {

        Notificacao notificacao
        //Pegar usuario logado (politoc)
        Usuario usuarioLogado = springSecurityService.currentUser
        Pessoa pessoa = Politico.findByUsuario(usuarioLogado)
        notificacao.dataHora = new Date()
        notificacao.descricao = params.descricao
        notificacao.isVisualizada = false
        notificacao.pessoa = pessoa
        notificacao.titulo = params.titulo
        notificacao.validate()
        if (notificacao.hasErrors()) {
            def listaErros = []
            notificacao.errors.each { erro ->
                listaErros += g.message(message: erro.fieldError.defaultMessage, error: erro.fieldError)
            }
            def mensagem = ["erro": listaErros]
            render mensagem as JSON

        } else {
            notificacao = notificacao.save(flush: true)
            render notificacao as JSON
        }


    }

    def listar() {
        Usuario usuarioLogado = springSecurityService.currentUser
        def pessoa = Pessoa.findByUsuario(usuarioLogado)
        def notificacao = notificacaoService.listar(pessoa)
        render(template: 'news', model: [listaNotificacoes: notificacao])
    }




    def quantidade() {
        Usuario usuarioLogado = springSecurityService.currentUser
        def pessoa = Pessoa.findByUsuario(usuarioLogado)
        session["notificacoes"] = notificacaoService.notificacoes(pessoa)
        render ""
    }

    def limpar(){

        Usuario usuarioLogado = springSecurityService.currentUser
        def pessoa = Pessoa.findByUsuario(usuarioLogado)
        def notificacao = notificacaoService.limpar(pessoa)
        render(template: 'news', model: [listaNotificacoes: notificacao])
    }
    def excluir(int id){
       def notificacao = notificacaoService.excluir(id)
        render(template: 'news', model: [listaNotificacoes: notificacao])
    }

}

