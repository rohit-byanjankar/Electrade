package ec_grails

class Category {
    String categoryName
    String description
    static constraints = {
    }

    String toString(){
        return categoryName
    }
}
