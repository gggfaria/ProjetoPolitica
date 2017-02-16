package politica

import grails.plugin.springsecurity.SpringSecurityUtils
import spock.lang.*

/**
 *
 */
class PerguntaIntegrationSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Editar pergunta corretamente"() {
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
            throw new Exception("erro proposta")
        }

        def pergunta = new Pergunta();
        pergunta.descricao = "Pergunta de um eleitor?"
        pergunta.data = new Date()
        pergunta.isAtivada = true
        pergunta.isRespondida = false
        pergunta.proposta = Proposta.findByTitulo("TITULO DA PROPOSTA TESTE PARA EDITAR")
        pergunta.pessoa = Pessoa.findByEmail("gabrielguima93@gmail.com")
        pergunta.validate()

        if (!pergunta.hasErrors())
            pergunta = pergunta.save(flush: true)
        else {
            throw new Exception("erro pergunta")
        }

        PerguntaController controller = new PerguntaController()

        SpringSecurityUtils.doWithAuth("gabrielguima93@gmail.com") {
            controller.params.perguntaId = Pergunta.findByDescricao("Pergunta de um eleitor?").id
            controller.params.descricao = "Teste integração alterando descrição"
            controller.atualizar()
        }

        then:
        controller.response.json.descricao == "Teste integração alterando descrição"
    }
}
