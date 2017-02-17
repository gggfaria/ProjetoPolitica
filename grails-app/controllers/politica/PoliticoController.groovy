package politica

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.hibernate.criterion.CriteriaSpecification

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class PoliticoController {
    transient springSecurityService

    def index() {


        render(view: "index")
    }

    def perguntas(){
        Usuario usuarioLogado = springSecurityService.currentUser
        def politico = Politico.findByUsuario(usuarioLogado)

        def perguntas = Pergunta.createCriteria().list {
            createAlias("proposta", "p", CriteriaSpecification.INNER_JOIN)
            eq("p.politico.id", politico.id)
            eq('isAtivada', true)
            order("isRespondida", 'asc')


        }
        render(view: "perguntas", model: ["perguntas": perguntas])
    }

    @Secured(['ROLE_POLITICO'])
    def meusDados() {

        Usuario usuarioLogado = springSecurityService.currentUser
        def pessoa = Politico.findByUsuario(usuarioLogado)

        render(view: "meusDados", model: ["pessoa": pessoa])

    }


    def listar() {
        def politicos = Politico.list()
        render(view: "listar", model: [lista: politicos])
    }


    def exibirPropostas() {

        def politicoId = params.id.toLong()

        def areas = null;
        def propostas = null;

        if (politicoId) {
            areas = Area.createCriteria().list {
                setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY)
                createAlias("propostas", "prop", CriteriaSpecification.INNER_JOIN)
                createAlias("prop.politico", "pol", CriteriaSpecification.INNER_JOIN)
                eq("prop.politico.id", politicoId)
            }

            propostas = Proposta.createCriteria().list {
                createAlias("area", "a", CriteriaSpecification.INNER_JOIN)
                politico {
                    idEq(params.id.toLong())
                }

            }

        }

        if (areas) {
            //render(template: "proposta", model: [propostas: propostas])
            render(view: "proposta", model: ["areas": areas, "propostas" : propostas])
        } else {
            render(view: "proposta", model: ["areas": areas, "propostas" : propostas])
        }

    }

    def politicoService

    @Secured(['ROLE_POLITICO'])
    def pegarNotificacao() {
        Usuario usuarioLogado = springSecurityService.currentUser
        def politico = Politico.findByUsuario(usuarioLogado)
        session["notificacao"] = politicoService.Notificacoes(politico)
        render ""
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def carregarEleitos(){
        def eleitos = Politico.findAllByIsEleito(true)

        render(view: "eleitos", model: ["eleitos": eleitos])
    }



}
