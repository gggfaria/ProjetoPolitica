package politica

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils;

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class LoginController {

    def index() {

    }

    def logar(){


        render(view : "logar", model:[error:params.login_error])
    }

    def logout(){
        redirect(action: "logar")
    }

}
