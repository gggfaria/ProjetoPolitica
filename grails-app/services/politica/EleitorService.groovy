package politica

import grails.transaction.Transactional
import org.hibernate.criterion.CriteriaSpecification

@Transactional
class EleitorService {

    def naoRespondidas(Eleitor eleitor) {
        def perguntas = Pergunta.createCriteria()
        def result = perguntas.list {
            projections {
                count()
            }
            eq('pessoa', eleitor)
            eq('isRespondida', false)
        }
        return result.toString().replace("[", "").replace("]", "")
    }


    def Respondidas(Eleitor eleitor) {
        def perguntas = Pergunta.createCriteria()
        def result = perguntas.list {
            projections {
                count()
            }
            eq('pessoa', eleitor)
            eq('isRespondida', true)
        }
        return result.toString().replace("[", "").replace("]", "")
    }

}
