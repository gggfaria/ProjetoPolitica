package politica

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
