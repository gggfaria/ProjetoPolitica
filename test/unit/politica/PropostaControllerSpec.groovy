package politica



import grails.test.mixin.*
import spock.lang.*

@TestFor(PropostaController)
@Mock(Proposta)
class PropostaControllerSpec extends Specification {


    void "Editar proposta" (){
        when:

        params.area = '3'
        params.idProposta = '5'
        params.titulo = 'Educação para todos'
        params.resumo = 'No meu governo todos terão edução, todos irão falar obrigado e de nada...'
        params.descricao = '... me desculpe, foi sem querer.'
        params.politico




        controller.atualizar()
        then:
        response.json.id != null


    }

 /*   def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.propostaInstanceList
            model.propostaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.propostaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            def proposta = new Proposta()
            proposta.validate()
            controller.save(proposta)

        then:"The create view is rendered again with the correct model"
            model.propostaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            proposta = new Proposta(params)

            controller.save(proposta)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/proposta/show/1'
            controller.flash.message != null
            Proposta.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def proposta = new Proposta(params)
            controller.show(proposta)

        then:"A model is populated containing the domain instance"
            model.propostaInstance == proposta
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def proposta = new Proposta(params)
            controller.edit(proposta)

        then:"A model is populated containing the domain instance"
            model.propostaInstance == proposta
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/proposta/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def proposta = new Proposta()
            proposta.validate()
            controller.update(proposta)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.propostaInstance == proposta

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            proposta = new Proposta(params).save(flush: true)
            controller.update(proposta)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/proposta/show/$proposta.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/proposta/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def proposta = new Proposta(params).save(flush: true)

        then:"It exists"
            Proposta.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(proposta)

        then:"The instance is deleted"
            Proposta.count() == 0
            response.redirectedUrl == '/proposta/index'
            flash.message != null
    }*/
}
