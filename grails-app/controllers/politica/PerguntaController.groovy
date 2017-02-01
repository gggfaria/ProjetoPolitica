package politica

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured


class PerguntaController {
    transient springSecurityService

    PerguntaService perguntaService
    PropostaService propostaService

    @Secured(['ROLE_ELEITOR'])
    def index() {

    }


    @Secured(['ROLE_ELEITOR'])
    def salvar() {
        Usuario usuarioLogado = springSecurityService.currentUser
        Pessoa eleitor = Eleitor.findByUsuario(usuarioLogado)
        Pergunta pergunta = new Pergunta()
        pergunta.descricao = params.descricao
        pergunta.data = new Date()
        pergunta.isAtivada = true
        pergunta.isRespondida = false
        pergunta.proposta = propostaService.selectPropostaId(params.propostaId.toLong())
        pergunta.pessoa = eleitor
        pergunta.validate()

        if(pergunta.hasErrors()){
            def listaErros = []
            pergunta.errors.allErrors.each{ erro ->
                listaErros.add(g.message(message: erro.defaultMessage, error: erro))
            }

            def mensagem = ["erro": listaErros]
            render mensagem as JSON

        }else{
            //Gravando Notificação
            Proposta proposta = Proposta.findById(params.propostaId)
            Pessoa pessoaPergunta
            pessoaPergunta = Pessoa.findByUsuario(usuarioLogado)
            Notificacao notificacao = new Notificacao()
            notificacao.dataHora = new Date()

            notificacao.isVisualizada = false
            notificacao.titulo = " " + pessoaPergunta.nome + " te fez uma pergunta"
            notificacao.descricao = pergunta.descricao
            def alvoNotificacao = Pessoa.findById(proposta.politico.id)
            notificacao.pessoa = alvoNotificacao
            pergunta = perguntaService.salvarPergunta(pergunta)
            notificacao.caminho = pergunta.id
            notificacao.save(flush: true)
            //-----------------------------
            render pergunta as JSON
        }

    }


    @Secured(['ROLE_POLITICO'])
    def responder() {

        Usuario usuarioLogado = springSecurityService.currentUser
        def politico = Politico.findByUsuario(usuarioLogado)


        if (params.id) {
            def pergunta = Pergunta.findById(params.id)
            if (pergunta.proposta.politico.id != politico.id) {
                redirect(controller: "politico", action: "perguntas")
            } else if (pergunta.isRespondida) {
                redirect(controller: "politico", action: "perguntas")
            } else {
                render(view: "responder", model: ["pergunta": pergunta])
            }

        }else{
            redirect(controller: "politico", action: "perguntas")
        }


    }





    @Secured(['ROLE_ELEITOR'])
    def listar() {
        Usuario usuarioLogado = springSecurityService.currentUser
        def eleitor = Eleitor.findByUsuario(usuarioLogado)
        def perguntas = Pergunta.createCriteria().list {
            order("isRespondida", 'asc')
            eq('isAtivada', true)
            eq("pessoa.id", eleitor.id.toLong())
        }

        render(view: "listar", model: ["perguntas": perguntas])
    }

    @Secured(['ROLE_ELEITOR'])
    def exibirPergunta() {
        def perguntaId = params.id
        def perguntas = Pergunta.createCriteria().list {
            idEq(perguntaId.toLong())
        }

        render(view: "editar", model: ["perguntas": perguntas])
    }

    @Secured(['ROLE_ELEITOR'])
    def atualizar() {

        Usuario usuarioLogado = springSecurityService.currentUser
        def eleitor = Eleitor.findByUsuario(usuarioLogado)

        def perguntaId = params.perguntaId.toLong()

        print(perguntaId)

        def pergunta = new Pergunta()

        if (perguntaId) {
            pergunta = Pergunta.findById(perguntaId)

        }

        pergunta.descricao = params.descricao

        //print(pergunta.resposta.id)

        pergunta.validate()


        if (pergunta.hasErrors()) {
            def listaErros = []

            print(pergunta.errors.allErrors)
            pergunta.errors.allErrors.each { erro ->
                listaErros.add(g.message(message: erro.defaultMessage, error: erro))
            }

            def mensagem = ["erro": listaErros]
            println(mensagem)

            render mensagem as JSON
        } else {
            pergunta = pergunta.save(flush: true)
            render pergunta as JSON

        }
    }

}