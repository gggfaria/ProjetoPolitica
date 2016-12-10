package politica

import grails.plugin.springsecurity.SpringSecurityService
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(RespostaController)
@Mock([Politico])
class RespostaControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "responder pergunta eleitor"() {
      /*      given:
                // Setup Collaborator get for controller action

                def politicoMock = mockFor(Politico)
                // Setup SpringSecurityService mock
                Usuario logado = new Usuario(id: 1, username: "Pessoa teste" )
                Politico politico = new Politico(id: 1, nome: "Usuario teste", usuario: logado)


                def springSecurityService = mockFor(SpringSecurityService, true)
                springSecurityService.demand.currentUser { -> logado }
                controller.springSecurityService = springSecurityService.createMock()
                politico.demand.static.findByUsuario() {Long id -> new Usuario(id: 1, name: "Usuario teste") }

            when:
                controller.editCollaborator()
            then:
                view == "/collaborator/edit"            ((model.currentCollaborator == null) || (model.currentCollaborator.name == "User test"))
        */

    }



}
