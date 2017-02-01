package politica

import org.hibernate.criterion.CriteriaSpecification
import grails.transaction.Transactional

@Transactional
class PoliticoService {

    def serviceMethod() {

    }

    def Notificacoes(Politico politico) {
        def perguntas = Pergunta?.createCriteria().list {
            createAlias("proposta", "p", CriteriaSpecification.INNER_JOIN)
            eq("p.politico.id", politico?.id)
            eq("isRespondida", false)
        }

        return perguntas.size()
    }
}
