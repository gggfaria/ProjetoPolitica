package politica

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.SpringSecurityUtils
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

        SpringSecurityUtils.doWithAuth("joao.jose@mail.com") {

            controller.params.area = proposta.areaId
            controller.params.id = proposta.id
            controller.params.titulo = "NOVO TITULO DA PROPOSTA TESTE PARA EDITAR"
            controller.params.resumo = proposta.resumo
            controller.params.descricao = proposta.descricao

            controller.atualizar()
        }

        then:
        controller.response.json.proposta.titulo == "NOVO TITULO DA PROPOSTA TESTE PARA EDITAR"

    }


    void "Avaliar proposta"() {
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

        SpringSecurityUtils.doWithAuth("gabrielguima@mail.com") {

            controller.params.valor = '4'
            controller.params.id = proposta.id
            controller.avaliar()
        }

        then:
        controller.response.json.valor == "4"

    }
}
