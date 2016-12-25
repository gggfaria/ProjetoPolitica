package politica

import grails.transaction.Transactional

@Transactional
class PerguntaService {


    def salvarPergunta(Pergunta pergunta) {
        try {
            pergunta = pergunta.save(flush: true)
            return pergunta
        } catch (Exception excecao) {
            return pergunta
        }

    }

    def perguntaPertenceUsuario(Pergunta pergunta, long pessoaId) {
        boolean retorno

        if (pergunta.id) {
            if (pergunta.proposta.politico.id != pessoaId) {
                retorno = false
            } else
                retorno = true
        } else
            retorno = false

        return retorno

    }

    def selectPerguntaId(long perguntaId) {
        def pergunta = new Pergunta()

        if (perguntaId) {
            pergunta = Pergunta.findById(perguntaId)
        }

        return pergunta
    }


}
