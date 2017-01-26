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

        def tamanho = 0
        def soma = 0
        def somaQuantidadeNotas = 0
        def porcentagem = []
        
        valoresNotas.each {
            tamanho ++
        }
        
        for (int i=0;i<tamanho;i++) {
            soma += valoresNotas[i] * quantidadeNotas[i]
            somaQuantidadeNotas += quantidadeNotas[i]
        }
        
        for (int i=0;i<tamanho;i++) {
            porcentagem[i] = ((valoresNotas[i]*quantidadeNotas[i]*100) / soma)
        }
        
        return soma / somaQuantidadeNotas
    }
    
    def porcentagemNota(def valoresNotas, def quantidadeNotas) {
        
        def tamanho = valoresNotas.size().toInteger()
        def soma = 0
        def porcentagem = []
        
                
        for (int i=0;i<tamanho;i++) {
            soma += quantidadeNotas[i]
        }
        
        print(valoresNotas.size())
        
        for (int i=0;i<tamanho;i++) {
            porcentagem[i] = ((quantidadeNotas[i]*100) / soma)
        }
        
        print(porcentagem)
                
        return porcentagem
    }
}
