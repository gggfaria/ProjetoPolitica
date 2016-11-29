package politica

import grails.converters.JSON
import org.hibernate.criterion.CriteriaSpecification
import grails.plugin.springsecurity.annotation.Secured

class PropostaController {

    def index() {
        def politicos = Politico.list()
        def areas = Area.createCriteria().list { order("nome") }

        render(view: "index", model: [listaAreas: areas, listaPoliticos: politicos])
    }

    @Secured(['ROLE_POLITICO'])
    def salvar() {
        Proposta proposta
        Integer politicoId = params.politico?.toInteger()
        Integer areaId = params.area?.toInteger()
        if(params.id) // se o formulario tem id, pega o objeto do BD
        {
            proposta.id = proposta.get(params.id)
        } else {
            proposta = new Proposta()
        }
        proposta.titulo = params.titulo
        proposta.resumo = params.resumo
        proposta.descricao = params.descricao
        proposta.politico = Politico.get(politicoId)
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

    def pergunta() {

        if (!params.id) {
            render(view: '/erro404', model: [mensagem: 'Proposta não especificada']);
        } else {

            Proposta proposta = Proposta.findById(params.id.toLong())



            if (proposta == null) {
                render(view: '/erro404', model: [mensagem: 'Proposta não encontrada']);
            } else {
                render(view: "pergunta", model: [proposta: proposta]);
            }
        }
    }

    def erro404() {
        render(view: "/error", model: [status: 404, exception: "Id da Proposta não especificado"]);
    }

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
