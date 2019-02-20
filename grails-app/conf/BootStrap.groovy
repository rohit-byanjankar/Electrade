import ec_grails.Category
import ec_grails.User
class BootStrap {

    def init = { servletContext ->
        if(!User.getAll()){
        new User(name: "admin",email: "admin@admin.com",password: "admin",role: "Admin").save()
        }

        if(!Category.getAll()){
            new Category(categoryName: "Computer" , description: "AAAAAAA" ).save()
            new Category(categoryName: "Furniture" , description: "BBBBBB" ).save()
        }
    }
    def destroy = {
    }
}
