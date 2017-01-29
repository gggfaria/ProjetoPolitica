package politica

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class NotaController {

    transient springSecurityService

    def notaService

    @Secured(['ROLE_ELEITOR'])
    def carregarNotaUsuario() {
        if (params.id) {
            def id = params.id.toLong()
            Usuario usuarioLogado = springSecurityService.currentUser
            Eleitor eleitor = Eleitor.findByUsuario(usuarioLogado)

            def nota = Nota.createCriteria().get {
                eq("proposta.id", id)
                eq("eleitor.id", eleitor.id)
            }
            if (nota) {
                render nota as JSON
            } else {
                def mensagem = [valor: 5]
                render mensagem as JSON
            }


        }
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def carregarMediaNotas() {
        if (params.id) {
            def propostaId = params.id.toLong()

            def notas = notaService.selectQuantidadePorNotas(propostaId)

            if (notas) {
                def valoresNotas = []
                def quantidadeNotas = []

                notas.each { nota ->
                    valoresNotas << nota[0]
                    quantidadeNotas << nota[1]
                }

                def mediaNotas = notaService.mediaNotas(valoresNotas, quantidadeNotas)

                def porcentagemNota = notaService.porcentagemNota(valoresNotas, quantidadeNotas)

                def resposta = [nota: valoresNotas, quantidade: quantidadeNotas, media: mediaNotas, porcentagem: porcentagemNota]

                render(view: "avaliacao", model: ["resposta": resposta])
            } else {
                render(view: "avaliacao", model: ["resposta": null])
            }

        } else
            redirect(controller: "politico", action: "listar")
    }

}
