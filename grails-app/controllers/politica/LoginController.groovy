package politica

import grails.plugin.springsecurity.annotation.Secured

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class LoginController {

    def index() {

    }

    def logar(){
        render(view : "logar")
    }

    def logout(){
        redirect(action: "logar")
    }

}
