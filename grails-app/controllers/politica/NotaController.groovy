package politica

import grails.converters.JSON
import org.hibernate.criterion.CriteriaSpecification
import grails.plugin.springsecurity.annotation.Secured

class NotaController {

    transient springSecurityService

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
            }else{
                def mensagem = [valor:5]
                render mensagem as JSON
            }


        }


    }
}
