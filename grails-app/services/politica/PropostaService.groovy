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

    def propostaPertenceUsuario(Proposta proposta, long pessoaId) {
        boolean retorno

        if (proposta.id) {
            if (proposta.politico.id != pessoaId) {
                retorno = false
            } else
                retorno = true
        } else
            retorno = false

        return retorno

    }






}
