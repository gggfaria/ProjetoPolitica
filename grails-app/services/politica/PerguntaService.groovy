package politica

import grails.transaction.Transactional

@Transactional
class PerguntaService {

    def verificarUsuarioPerguntaProposta(int perguntaId, int pessoaId) {
        boolean retorno

        if (perguntaId) {
            def  pergunta = selectPergunta(perguntaId)
            if (pergunta.proposta.politico.id != pessoaId) {
                retorno = false
            }else
                retorno = true
        }else
            retorno = false

        return retorno

    }

    def isPerguntaRespondida(int perguntaId){
        boolean retorno

        if (perguntaId) {
            def  pergunta = selectPergunta(perguntaId)
            if(pergunta.isRespondida){
                retorno = true
            }else
                retorno = true
        }else
            retorno = false

        return retorno
    }

    def selectPerguntaId(int perguntaId){
        def pergunta = new Pergunta()

        if (perguntaId) {
           pergunta = Pergunta.findById(perguntaId)
        }

        return pergunta
    }


}
