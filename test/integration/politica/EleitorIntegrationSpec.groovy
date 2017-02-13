package politica



import spock.lang.*

/**
 *
 */
class EleitorIntegrationSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Validar Email Ja Cadastrado" (){
        when:
        EleitorController controller = new EleitorController()

        controller.params.email = 'joao.jose@mail.com'
        controller.validarEmail()

        then:
        controller.response.json.erro == "E-mail já cadastrado"


    }
}
