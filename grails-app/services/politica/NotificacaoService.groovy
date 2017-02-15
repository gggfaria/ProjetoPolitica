package politica

import grails.transaction.Transactional
import org.hibernate.criterion.CriteriaSpecification
@Transactional
class NotificacaoService {

    def serviceMethod() {

    }

    def notificacoes(Pessoa pessoa) {
        def notificacoes =  Notificacao.createCriteria()
        def result = notificacoes.list {
            projections {
                count()
            }
            eq ('pessoa', pessoa)
            eq('isVisualizada', false)


        }
        return result.toString().replace("[","").replace("]", "")
    }

    def listar(Pessoa pessoa){
        def notificacoes =  Notificacao.createCriteria()
        def result = notificacoes.list {
            eq ('pessoa', pessoa)
            order('isVisualizada')
            order('dataHora', 'desc')

        }
        return result
    }

    def limpar(Pessoa pessoa){
        def notificacoes =  Notificacao.createCriteria()
        def result = notificacoes.list {
            eq ('pessoa', pessoa)
        }

        for (int i = 0; i < result.size(); i++)
        {
            result[i].isVisualizada = true;
            result[i].save()
        }
        return result
    }

    def excluir(int id){
        def notificacao =  Notificacao.findById(id)
        notificacao?.delete()

    }

    def visualizar(int id){
        def notificacao =  Notificacao.findById(id)
        notificacao?.isVisualizada = true
        notificacao.save()

    }

}
