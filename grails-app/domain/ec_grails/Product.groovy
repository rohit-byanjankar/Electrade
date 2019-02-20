package ec_grails

class Product {
    String productName
    String price
    Category category
    String quantity
    String image
    static constraints = {
        productName(nullable: false)
        quantity(nullable: false)
        price(nullable: false)
        image(nullable: true)
        category()
    }

    String toString(){
        return id
    }
}
