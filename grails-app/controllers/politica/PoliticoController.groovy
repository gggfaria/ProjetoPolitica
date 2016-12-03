package politica

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.hibernate.criterion.CriteriaSpecification

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class PoliticoController {

    def index() {
        def perguntas = Pergunta.createCriteria().list {
            order("isRespondida", 'desc')
            eq('isAtivada',true)
        }


        render (view:"index", model: ["perguntas": perguntas])

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

        def areas = Area.createCriteria().list{
            setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY)
            createAlias("proposta","prop", CriteriaSpecification.INNER_JOIN)
            createAlias("prop.politico","pol", CriteriaSpecification.INNER_JOIN)
            eq("prop.politico.id",params.id.toLong())
        }

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
