package politica

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_POLITICO'])
class RespostaController {
    transient springSecurityService

    def index() {}

    def salvar() {
        Usuario usuarioLogado = springSecurityService.currentUser
        def politico = Politico.findByUsuario(usuarioLogado)

        def pergunta = new Pergunta()
        def resposta = new Resposta()
        boolean erroPergunta = false // TODO temporario


        if (params.perguntaId) {
            def idPergunta = params.perguntaId.toLong()


            pergunta = Pergunta.findById(idPergunta)

            if (pergunta.proposta.politico.id != politico.id) {
                //TODO renderizar erro "pergunta não pertence ao usuário logado"
                print('Pergunta não pertence ao usuário logado')

                erroPergunta = true
            }
            if (pergunta.isRespondida) {
                //TODO renderizar erro
                print('Pergunta já foi respondida')
                erroPergunta = true
            }


        } else {
            //TODO renderizar erro "Pergunta deve ser informada"
            print('Pergunta deve ser informada')
            erroPergunta = true
        }


        pergunta.isRespondida = true
        resposta.descricao = params.descricao
        resposta.data = new Date()
        resposta.isAtivada = true
        resposta.pergunta = pergunta
        resposta.politico = politico



        resposta.validate()
        pergunta.validate()

        if (resposta.hasErrors() || pergunta.hasErrors() || erroPergunta) {
            def listaErros = []

            print(resposta.errors.allErrors)
            resposta.errors.allErrors.each { erro ->
                listaErros.add(g.message(message: erro.defaultMessage, error: erro))
            }
            pergunta.errors.allErrors.each { erro ->
                listaErros.add(g.message(message: erro.defaultMessage, error: erro))
            }


            def mensagem = ["erro": listaErros]
            println(mensagem)
            render mensagem as JSON

        } else {
            pergunta.resposta = resposta
            pergunta = pergunta.save(flush: true)
            render resposta as JSON
        }

    }


}
