package politica

import grails.transaction.Transactional

@Transactional
class PropostaService {

    def selectPropostaId(long propostaId) {
        def proposta = new Proposta()

        if (propostaId) {
            proposta = Pergunta.findById(propostaId)
        }

        return proposta
    }


}
