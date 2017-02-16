package politica

import grails.transaction.Transactional
import org.hibernate.criterion.CriteriaSpecification

@Transactional
class NotificacaoService {

    def serviceMethod() {

    }

    def notificacoes(Pessoa pessoa) {
        def notificacoes = Notificacao.createCriteria()
        def result = notificacoes.list {
            projections {
                count()
            }
            eq('pessoa', pessoa)
            eq('isVisualizada', false)


        }
        return result.toString().replace("[", "").replace("]", "")
    }

    def listar(Pessoa pessoa) {
        def notificacoes = Notificacao.createCriteria()
        def result = notificacoes.list {
            eq('pessoa', pessoa)
            order('isVisualizada')
            order('dataHora', 'desc')

        }
        return result
    }

    def limpar(Pessoa pessoa) {
        def notificacoes = Notificacao.createCriteria()
        def result = notificacoes.list {
            eq('pessoa', pessoa)
        }

        for (int i = 0; i < result.size(); i++) {
            result[i].isVisualizada = true;
            result[i].save()
        }
        return result
    }

    def excluir(int id) {
        def notificacao = Notificacao.findById(id)
        notificacao?.delete()

    }

    def visualizar(int id) {
        def notificacao = Notificacao.findById(id)
        notificacao?.isVisualizada = true
        notificacao.save()

    }

    def atualizarStatus(Politico politico, Proposta proposta) {
        def mensagem = politico.nome + " alterou o status de uma proposta sobre " + proposta.area.nome + " como " + "'" + proposta.status.id + "'"

        def pessoas = Eleitor.findAll()
        for (int i = 0; i < pessoas.size(); i++) {
            Notificacao notificacao = new Notificacao()
            notificacao.titulo = mensagem
            notificacao.caminho = proposta.id
            notificacao.dataHora = new Date()
            notificacao.descricao = "Não fique de fora dessa, " + pessoas[i].nome + "!"
            notificacao.isVisualizada = false
            notificacao.pessoa = pessoas[i]
            notificacao.validate()
            notificacao = notificacao.save(flush: true)
        }
    }

}
