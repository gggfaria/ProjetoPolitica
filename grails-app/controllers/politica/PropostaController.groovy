package politica

import grails.converters.JSON
import org.hibernate.criterion.CriteriaSpecification
import grails.plugin.springsecurity.annotation.Secured


class PropostaController {
    transient springSecurityService

    @Secured(['ROLE_POLITICO'])
    def index() {
        def politicos = Politico.list()
        def areas = Area.createCriteria().list { order("nome") }

        render(view: "index", model: [listaAreas: areas, listaPoliticos: politicos])
    }

    @Secured(['ROLE_POLITICO'])
    def salvar() {
        Proposta proposta
        //Pegar usuario logado (politoc)
        Usuario usuarioLogado = springSecurityService.currentUser
        Politico politico = Politico.findByUsuario(usuarioLogado)

        Integer areaId = params.area?.toInteger()

        /*if(params.id) // se o formulario tem id, pega o objeto do BD
        {
            proposta.id = proposta.get(params.id)
        } else {
            proposta = new Proposta()
        }*/

        proposta = new Proposta()

        proposta.titulo = params.titulo
        proposta.resumo = params.resumo
        proposta.descricao = params.descricao
        proposta.politico = politico
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

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def pergunta() {

        if (!params.id) {
            render(view: '/erro404', model: [mensagem: 'Proposta não especificada']);
        } else {

            Proposta proposta = Proposta.findById(params.id.toLong())
            proposta.perguntas.sort{it.data} //TODO ORDERNAR DESC



            if (proposta == null) {
                render(view: '/erro404', model: [mensagem: 'Proposta não encontrada']);
            } else {
                render(view: "pergunta", model: [proposta: proposta]);
            }
        }
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def erro404() {
        render(view: "/error", model: [status: 404, exception: "Id da Proposta não especificado"]);
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def listarPerguntas(){

        def perguntas = Pergunta.createCriteria().list {
            eq("isAtivada",true)
            proposta{
                idEq(params.id.toLong())
            }
            order("data","desc")

        }


        render(view: "perguntas", model: ["perguntas":perguntas])
    }

}
