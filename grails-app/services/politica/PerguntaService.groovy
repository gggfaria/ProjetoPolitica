package politica

import grails.transaction.Transactional

@Transactional
class PerguntaService {



    def salvarPergunta(Pergunta pergunta){
        try{
            pergunta = pergunta.save(flush: true)
            return pergunta
        }catch (Exception excecao){
            return pergunta
        }

    }

    def verificarUsuarioPerguntaProposta(long perguntaId, long pessoaId) {
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

    def isPerguntaRespondida(long perguntaId){
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

    def selectPerguntaId(long perguntaId){
        def pergunta = new Pergunta()

        if (perguntaId) {
           pergunta = Pergunta.findById(perguntaId)
        }

        return pergunta
    }


}
