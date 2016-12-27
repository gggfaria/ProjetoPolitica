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


        if (pergunta.hasErrors()) {
            def listaErros = []
            pergunta.errors.allErrors.each { erro ->
                listaErros.add(g.message(message: erro.defaultMessage, error: erro))
            }

            def mensagem = ["erro": listaErros]
            render mensagem as JSON

        } else {
            pergunta = perguntaService.salvarPergunta(pergunta)
            render pergunta as JSON
        }

    }


    @Secured(['ROLE_POLITICO'])
    def responder() {

        Usuario usuarioLogado = springSecurityService.currentUser
        def politico = Politico.findByUsuario(usuarioLogado)

        if (params.id) {
            def perguntaId = params.id.toLong()

            Pergunta pergunta = perguntaService.selectPerguntaId(perguntaId)
            if (pergunta == null) {
                render(view: '/erro404', model: [mensagem: 'Pergunta não encontrada']);
            }

            if ((!pergunta.isRespondida)) {
                if( perguntaService.perguntaPertenceUsuario(pergunta, politico.id)){
                    render(view: "responder", model: ["pergunta": pergunta])
                }else {
                    render(view: '/erro404', model: [mensagem: 'Pergunta não pertence ao usuário logado']);
                }
            } else {
                render(view: '/erro404', model: [mensagem: 'Pergunta já foi respondida']);
            }
        }else
        {
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

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY', 'ROLE_ELEITOR','ROLE_POLITICO' ])
    def erro404() {
        render(view: "/error", model: [status: 404, exception: "Id da Proposta não especificado"]);
    }


}
