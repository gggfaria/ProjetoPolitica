package politica

import grails.converters.JSON
import org.hibernate.criterion.CriteriaSpecification
import grails.plugin.springsecurity.annotation.Secured


class PropostaController {
    transient springSecurityService

    PropostaService _propostaService = new PropostaService()

    @Secured(['ROLE_POLITICO'])
    def index() {
        def politicos = Politico.list()
        def areas = Area.createCriteria().list { order("nome") }

        render(view: "index", model: [listaAreas: areas, listaPoliticos: politicos])
    }


    @Secured(['ROLE_POLITICO'])
    def listar() {
        def politicos = Politico.list()
        def areas = Area.createCriteria().list { order("nome") }
        def propostas = Proposta.list()
        render(view: "listar", model: [listaAreas: areas, listaPoliticos: politicos, listaProposta: propostas])

    }

    @Secured(['ROLE_POLITICO'])
    def listarProposta() {
        def proposta = Proposta.findById(params.id)
        render proposta as JSON
    }


    @Secured(['ROLE_POLITICO'])
    def salvar() {

        Proposta proposta
        //Pegar usuario logado (politico)
        Usuario usuarioLogado = springSecurityService.currentUser
        Politico politico = Politico.findByUsuario(usuarioLogado)

        Integer areaId = params.area?.toInteger()

        if (params.id == false) // se o formulario tem id, pega o objeto do BD
        {
            proposta.id = params.id?.toLong()
        } else {
            proposta = new Proposta()
        }

        proposta = new Proposta()

        proposta.titulo = params.titulo
        proposta.resumo = params.resumo
        proposta.descricao = params.descricao
        proposta.politico = politico
        proposta.politico.id = politico.id
        proposta.area = Area.get(areaId)
        proposta.dataPublicacao = new Date()
        proposta.validate()
        if (proposta.hasErrors()) {
            def listaErros = []
            proposta.errors.each { erro ->
                listaErros += g.message(message: erro.fieldError.defaultMessage, error: erro.fieldError)
            }
            def mensagem = ["erro": listaErros]
            render mensagem as JSON

        } else {
            proposta = proposta.save(flush: true)
            render proposta as JSON
        }


    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def pergunta() {

        if (!params.id) {
            render(view: '/erro404', model: [mensagem: 'Proposta não especificada']);
        } else {

            def proposta = Proposta.findById(params.id.toLong())

            if (proposta == null) {
                render(view: '/erro404', model: [mensagem: 'Proposta não encontrada']);
            } else {
                render(view: "pergunta", model: [proposta: proposta]);
            }
        }
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY', 'ROLE_ELEITOR','ROLE_POLITICO' ])
    def erro404() {
        render(view: "/error", model: [status: 404, exception: "Id da Proposta não especificado"]);
    }


    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def atualizarPerguntas() {

        def perguntas = Pergunta.createCriteria().list {
            eq("isAtivada", true)
            proposta {
                idEq(params.id.toLong())
            }
            order("data", "desc")
        }

        render(view: "perguntas", model: ["perguntas": perguntas])
    }



    @Secured(['ROLE_POLITICO'])
    def atualizar() {

        Proposta proposta
        //Pegar usuario logado (politoc)
        Usuario usuarioLogado = springSecurityService.currentUser
        Politico politico = Politico.findByUsuario(usuarioLogado)

        Integer areaId = params.area?.toInteger()
        Integer idProposta = params.idProposta?.toInteger()
        proposta = Proposta.get(idProposta)
        proposta.titulo = params.titulo
        proposta.resumo = params.resumo
        proposta.descricao = params.descricao
        proposta.politico = politico
        proposta.politico.id = politico.id
        proposta.area = Area.get(areaId)
        proposta.validate()
        if (proposta.hasErrors()) {
            def listaErros = []
            proposta.errors.each { erro ->
                listaErros += g.message(message: erro.fieldError.defaultMessage, error: erro.fieldError)
            }
            def mensagem = ["erro": listaErros]
            render mensagem as JSON

        } else {
            proposta = proposta.save(flush: true)
            render proposta as JSON
        }


    }
}

