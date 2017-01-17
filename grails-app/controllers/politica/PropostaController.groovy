package politica

import grails.converters.JSON
import org.hibernate.criterion.CriteriaSpecification
import grails.plugin.springsecurity.annotation.Secured


class PropostaController {
    transient springSecurityService

    PropostaService propostaService

    @Secured(['ROLE_POLITICO'])
    def index() {
        def propostas = Proposta.list()

        render(view: "index", model: [propostas: propostas])
    }

    @Secured(['ROLE_POLITICO'])
    def formEditarProposta() {
        Usuario usuarioLogado = springSecurityService.currentUser
        Politico politico = Politico.findByUsuario(usuarioLogado)

        def propostaId = params.id.toLong()
        def proposta = propostaService.selectPropostaId(propostaId)

        def areas = Area.list()


        if (propostaService.propostaPertenceUsuario(proposta, politico.id)) {
            render(view: "editar", model: ["proposta": proposta, "areas": areas])
        } else {
            redirect(controller: "proposta", action: "index")
        }
    }


    @Secured(['ROLE_POLITICO'])
    def cadastrar() {

        def areas = Area.createCriteria().list { order("nome") }

        render(view: "cadastrar", model: [listaAreas: areas])
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

            print(proposta.errors.allErrors)
            proposta.errors.allErrors.each { erro ->

                println(erro)
                listaErros.add(g.message(message: erro.defaultMessage, error: erro))
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

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY', 'ROLE_ELEITOR', 'ROLE_POLITICO'])
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
        proposta = Proposta.get(params.id)
        proposta.titulo = params.titulo
        proposta.resumo = params.resumo
        proposta.descricao = params.descricao
        proposta.politico = politico
        proposta.politico.id = politico.id
        proposta.area = Area.get(areaId)
        proposta.validate()

        if (propostaService.propostaPertenceUsuario(proposta, politico.id)) {
            if (proposta.hasErrors()) {
                def listaErros = []
                proposta.errors.each { erro ->
                    listaErros += g.message(message: erro.fieldError.defaultMessage, error: erro.fieldError)
                }
                def mensagem = ["erro": listaErros]
                render mensagem as JSON

            } else {
                proposta = proposta.save(flush: true)
                print(proposta.area)
                def mapa = [proposta: proposta, area:proposta.area]

                render mapa as JSON
            }

        } else {
            redirect(controller: "proposta", action: "index")
        }
    }
    
    @Secured(['ROLE_ELEITOR'])
    def avaliar() {
        if (params.valor && params.id) {
            def valor = params.valor.toInteger()
            def id = params.id.toLong()
            Usuario usuarioLogado = springSecurityService.currentUser
            Eleitor eleitor = Eleitor.findByUsuario(usuarioLogado)
            def proposta = Proposta.get(id)

            def nota = Nota.createCriteria().get{
                eq("proposta.id", id)
                eq("eleitor.id", eleitor.id)
            }

            if(!nota.id){
                nota = new Nota()
            }

            nota.valor = valor
            nota.eleitor = eleitor
            nota.proposta = proposta

            nota.validate()

            if (nota.hasErrors()) {
                def listaErros = []

                print(nota.errors.allErrors)
                nota.errors.allErrors.each { erro ->

                listaErros.add(g.message(message: erro.defaultMessage, error: erro))
            }


            def mensagem = ["erro": listaErros]
            render mensagem as JSON

            } else {
                nota = nota.save(flush: true)
                render nota as JSON
            }
        }
    }
}

