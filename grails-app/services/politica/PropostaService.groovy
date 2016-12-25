package politica

import grails.transaction.Transactional

@Transactional
class PropostaService {

    def selectPropostaId(long propostaId) {
        def proposta = new Proposta()

        if (propostaId) {
            proposta = Proposta.findById(propostaId)
        }

        return proposta
    }


}
