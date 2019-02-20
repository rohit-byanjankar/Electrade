package ec_grails

class User {
    String name
    String email
    String password
    String role

    static constraints = {
        name(nullable: false,size: 5..25)
        password(nullable: false,minSize:5)
        email(email: true)
        role(inList: ["Admin","User","App"])
    }
}
