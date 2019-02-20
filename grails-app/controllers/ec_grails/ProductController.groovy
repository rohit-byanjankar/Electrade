package ec_grails

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProductController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Product.list(params), model:[productInstanceCount: Product.count()]
    }

    def show(Product productInstance) {
        respond productInstance
    }

    def create() {
        respond new Product(params)
    }

    @Transactional
    def save(Product productInstance) {
        if (productInstance == null) {
            notFound()
            return
        }

        if (productInstance.hasErrors()) {
            respond productInstance.errors, view:'create'
            return
        }

        String path="web-app/product/images/"
        MultipartHttpServletRequest mpr=(MultipartHttpServletRequest) request
        CommonsMultipartFile file=(CommonsMultipartFile) mpr.getFile("imageFile")
        String filepath=file.getOriginalFilename().toString()
        String date=System.currentTimeMillis().toString()
        filepath=date+filepath
        file.transferTo(new File(path+filepath))
        productInstance.image = filepath

        productInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
                redirect productInstance
            }
            '*' { respond productInstance, [status: CREATED] }
        }
    }

    def edit(Product productInstance) {
        respond productInstance
    }

    @Transactional
    def update(Product productInstance) {
        if (productInstance == null) {
            notFound()
            return
        }

        if (productInstance.hasErrors()) {
            respond productInstance.errors, view:'edit'
            return
        }

        String path="web-app/product/images/"
        MultipartHttpServletRequest mpr=(MultipartHttpServletRequest) request
        CommonsMultipartFile file=(CommonsMultipartFile) mpr.getFile("imageFile")
        String filepath=file.getOriginalFilename().toString()
        String date=System.currentTimeMillis().toString()
        filepath=date+filepath
        file.transferTo(new File(path+filepath))
        productInstance.image = filepath

        productInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Product.label', default: 'Product'), productInstance.id])
                redirect productInstance
            }
            '*'{ respond productInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Product productInstance) {

        if (productInstance == null) {
            notFound()
            return
        }

        productInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Product.label', default: 'Product'), productInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def productView(int id){
        def p=Product.createCriteria()
        def productCategory = p.list {
            eq("category",Product.get(params.category))
        }
        Product product=Product.get(id)
        [productCategory:productCategory , eachProduct:product]
    }

    def categoryItems(Long id){
        def p =Product.createCriteria()
        def products = p.list {
            eq("category", Product.get(id))
        }
       [products:products]
    }

    def userCartItems(){
        def productId=Product.get(params.product).id
        def quantity= Integer.parseInt(params.quantity)
        if(!session.cartMap){
            Map<Integer, Integer> cartMap= new HashMap<Integer, Integer>()
            cartMap.put(productId, quantity)
            session.setAttribute("cartMap", cartMap)
        } else {
            Map<Integer, Integer> cartMap=session.getAttribute("cartMap")
            cartMap.put(productId, quantity)
            session.setAttribute("cartMap",cartMap)
        }
        forward(controller: 'user' , action: 'dashboard')
    }

        // Export service provided by Export plugin
        def exportService
        def grailsApplication  //inject GrailsApplication
        def list = {
            if(!params.max) params.max = 10
            if(params.format && params.format != "html"){
                response.contentType = grailsApplication.config.grails.mime.types[params.format]
                response.setHeader("Content-disposition", "attachment; filename=product.${params.extension}")
                exportService.export(params.formats, response.outputStream,Product.list(params), [:], [:])
            }
            [ productInstanceList: Product.list( params ) ]
        }

    def viewCart(){

    }

    def checkout(){

    }

    def adminHome(){
        if(session.user!=null){
            render(view: "/user/home")
        }else{
            render(view: "/user/login")
        }
    }

    def removeFromCart(long id){
        Map<Integer,Integer> cartMap=session.getAttribute("cartMap")
        cartMap.remove(id)
        redirect(action: 'viewCart')
    }
}

