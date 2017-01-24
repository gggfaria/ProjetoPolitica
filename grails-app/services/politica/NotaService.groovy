package politica

import grails.transaction.Transactional

@Transactional
class NotaService {

    def selectQuantidadePorNotas(long propostaId) {
        def notas = Nota.executeQuery("SELECT valor, count(valor) as quantidade FROM Nota WHERE proposta.id = ? GROUP BY valor",
                [propostaId])

        return notas

    }

    def mediaNotas(def valoresNotas, def quantidadeNotas){

        def somaValoresNotas = 0
        valoresNotas.each { valor ->
            somaValoresNotas+= valor
        }

        def somaQuantidadeNotas = 0
        quantidadeNotas.each { qnt ->
            somaQuantidadeNotas += qnt
        }

        return somaValoresNotas*somaQuantidadeNotas / somaQuantidadeNotas
    }



}
