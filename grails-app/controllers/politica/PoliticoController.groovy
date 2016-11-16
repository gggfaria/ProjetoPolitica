package politica

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
        render(template: "proposta", model: [propostas: propostas])
    }




}
