 /*
Desafio
Defina um protocolo chamado Shape e um conjunto de structs que
representam formas geométricas e implementam esse protocolo.
Adicione os atributos e méto
*/

protocol Shape {
    var color: String { get set }
    
    func area() -> Double
    func perimeter() -> Double
}

struct Circle: Shape {
    var color: String
    var radius: Double
    
    func area() -> Double {
        return .pi * radius * radius
    }
    
    func perimeter() -> Double {
        return 2 * .pi * radius
    }
}

struct Rectangle: Shape {
    var color: String
    var width: Double
    var height: Double
    
    func area() -> Double {
        return width * height
    }
    
    func perimeter() -> Double {
        return 2 * (width + height)
    }
}


// Uso

let circle = Circle(color: "Red", radius: 5.0)
let rectangle = Rectangle(color: "Pink", width: 12.3, height: 8.0)

print ("Circle - Area \(circle.area())\nPerimeter: \(circle.perimeter())\nColor: \(circle.color)")

/* Saída:
Circle - Area 78.53981633974483
Perimeter: 31.41592653589793
Color: Red
*/