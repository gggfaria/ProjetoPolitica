package politica



import spock.lang.*

/**
 *
 */
class PropostaIntegrationSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Atualizar titulo Proposta"() {
        when:


            def proposta = new Proposta();
            proposta.titulo = "TITULO DA PROPOSTA TESTE PARA EDITAR"
            proposta.resumo = "RESUMO DA PROPOSTA TESTE PARA EDITAR - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in pretium mi"
            proposta.descricao = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in pretium mi. Nulla sed eros euismod, euismod neque eget, facilisis mauris. Mauris gravida suscipit pretium. Phasellus eget quam eget tellus convallis facilisis eu non nulla. Vestibulum euismod eget risus ac laoreet."
            proposta.politico = Politico.findByEmail("joao.jose@mail.com")
            proposta.area = Area.findByNome("Saúde")
            proposta.dataPublicacao = new Date()

            proposta.validate()
            if (!proposta.hasErrors())
                proposta = proposta.save(flush: true)
            else {
                print proposta.errors.allErrors
                throw new Exception("erro proposta")
            }


            PropostaController controller = new PropostaController()

            Usuario loggedInUser = Usuario.findByUsername("joao.jose@mail.com")
            def springSecurityService = mockFor(SpringSecurityService, true)

            springSecurityService.demand.getCurrentUser { -> loggedInUser }
            controller.springSecurityService = springSecurityService.createMock()

            collectMock.demand.static.get() {Long id -> collect }

            controller.params.area = proposta.areaId
            controller.params.id = proposta.id
            controller.params.titulo = "NOVO TITULO DA PROPOSTA TESTE PARA EDITAR"
            controller.params.resumo = proposta.resumo
            controller.params.descricao = proposta.descricao

            controller.atualizar()
        then:
            controller.response.json.proposta.titulo == "NOVO TITULO DA PROPOSTA TESTE PARA EDITAR"
            println(controller.response.json)
    }
}
