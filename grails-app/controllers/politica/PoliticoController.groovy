package politica

import grails.converters.JSON
import org.hibernate.criterion.CriteriaSpecification

class PoliticoController {

    def index() {
        render (view:"index")

    }


    def listar(){
        def politicos = Politico.list()
        render(view:"listar", model: [lista: politicos])
    }


    def exibirPropostas(){
       def propostas = Proposta.createCriteria().list {
           createAlias("area","a", CriteriaSpecification.INNER_JOIN)
           politico{
               idEq(params.id.toLong())
           }

        }

        def areas = Area.list()

        def resposta =["propostas":propostas, "areas":areas]

        if(propostas != null) {
            //render(template: "proposta", model: [propostas: propostas])
            render(view: "proposta", model: ["resposta":resposta])
        }else
        {
            //TODO ERRO
        }

    }




}
