package politica

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import org.codehaus.groovy.grails.web.servlet.mvc.SynchronizerTokensHolder
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(EleitorController)
@Mock([Eleitor, Usuario, UsuarioPermissao, Permissao])
class EleitorControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Cadastrar novo eleitor" (){
        when:

        //def tokenHolder = SynchronizerTokensHolder.store(session)
        //params[SynchronizerTokensHolder.TOKEN_URI] = '/humorista/salvar'
        // params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken(params[SynchronizerTokensHolder.TOKEN_URI])
        params.nome = 'Gabriel F'
        params.dataNascimento = '10/10/1990'
        params.email = 'gabriel@mail.com'

        params.sexo = 'MASCULINO'

        params.j_password = 'Senha'
        params.j_username = 'gabriel@mail.com'


        controller.cadastrar()
        then:
        response.json.id != null


    }



}
