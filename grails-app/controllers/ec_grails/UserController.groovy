package ec_grails

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject

import javax.servlet.http.HttpSession

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def logout(){
        forward(action: 'dashboard')
    }

    def home(){
        def username=params.name
        def password=params.password

        def user=User.findByNameAndPassword(username,password)
        if(!user){
            render(view: 'login')
        }else {
            session.user=user
        }
    }

    def dashboard(){
            def productList=Product.list(max: 5 , sort: 'id' , order: 'desc')
            render(view: '../dashboard' , model: [productList: productList])
        }

    def aboutUs(){
        render(view: 'aboutUs')
    }

    def searchResult={
        def categoryCriteria = Product.createCriteria()
        def categoryName=params.search
        def categoryId=params.categoryId
        def results = categoryCriteria.list {
            like("productName", "%$categoryName%")
            and {
                eq("category", Category.get(categoryId))
            }
        }
        [searchInitial:categoryName , results:results]
    }

    def mailService
    def sendingMail() {
        String asd=params.email
        String first=params.fname
        String last=params.lname
        String msg = "You have ordered the following products<br><table border='1'>" +
                "<tr>" +
                "<th>Product Name</th>" +
                "<th>Price</th>" +
                "<th>Quantity</th>" +
                "<th>Total</th>" +
                "</tr>"


        Map<Integer, Integer> cartMap = session.getAttribute("cartMap")
        def total = 0
        for (def keys : cartMap.keySet()) {
            def product = ec_grails.Product.get(keys)

            msg = msg + "<tr><td>${product.productName}</td>" +
                    "<td>${product.price}</td>" +
                    "<td align='center'>${cartMap.get(keys)}</td>" +
                    "<td>Rs.${total + (product.price.toInteger() * cartMap.get(keys).toInteger())}</td></tr>"
        }
        msg = msg + "</table>"

        mailService.sendMail {
            to asd
            subject "Hello "+first+" "+last
            html msg

            session.removeAttribute("cartMap")
            redirect(action: 'dashboard')
        }
    }

}
