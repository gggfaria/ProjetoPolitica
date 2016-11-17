package politica

import grails.converters.JSON

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
           politico{
               idEq(params.id.toLong())
           }

        }
        if(propostas != null) {

            //render(template: "proposta", model: [propostas: propostas])
            render propostas as JSON
        }else
        {
            //TODO ERRO
        }

    }




}
