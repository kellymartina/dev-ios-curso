// FUNÇÕES

func sum(num1: Int, num2: Int) -> Int {
    return num1 + num2
}
print(sum(num1: 10, num2: 3))

/* O sublinhado (_) é usado em Swift para omitir o rótulo do argumento externo quando a função é chamada. 
Se você não tivesse usado o _, teria que chamar a função com o nome do parâmetro, assim:  multiply(number: 3, by: 3) */
func multiply(_ number: Int, by multiplier: Int) -> Int {
    return multiplier * number
}
multiply(3, by: 3)

// Parâmetros variádicos: permite que a função aceite um número variável de argumentos do mesmo tipo.
func imprimir(_ values: Int...) {
    print(values)
}
imprimir(10, 20, 30, 40)

// Void: não retorna valor
func doSomething() {
    print("doSomething")
}

func foo(completion: () -> Void) {
    print("foo")
    completion()
    print("foo")
}
foo(completion: doSomething)


// CLOSURES
// bloco de código que pode ser armazenado em uma variável, passado como argumento para uma função, ou retornado de uma função

// dismissAction é uma variável opcional que pode armazenar uma closure.
var dismissAction: ((String) -> Void)?
// Dentro da função foo, a closure completion é chamada com name e age como argumentos.
func foo(name: String, age: Int,_ completion: (String, Int) -> Void) {
    completion(name, age)
}
// Aqui, a função foo é chamada com "Pedro" como name, 20 como age, e uma closure que imprime o nome e a idade.
foo(name: "Pedro", age: 20) { name, age in
        print("\(name) tem \(age) anos")
}

// Dentro da função, a closure operation é chamada com number1 e number2 como argumentos, e o resultado é impresso com o prefixo "Result: ".
func calculate(number1: Int, number2: Int, operation: (Int, Int) -> Int) {
    print("Result: \(operation(number1, number2))")
}

// $0 e $1 são referências aos primeiros e segundos parâmetros passados para a closure, respectivamente.
// Ou seja, a closure { $0 + $1 } é passada para realizar a soma de number1 e number2.
calculate(number1: 10, number2: 10) {$0 + $1} // 20


// STRUCT E CLASSES

// Struct
// A struct define uma estrutura de dados que, por padrão, é imutável. Para modificar propriedades mutáveis dentro de uma struct, você precisa usar a palavra-chave mutating.
struct RobotStruct {
    let series: Int
    let model: String
    var name: String
    
    func move() {
        print("moving...")
    }
    
    // func para alterar nome
    mutating func setName(newName name: String) {
        self.name = name
    }
}

var robot1 = RobotStruct(series: 2, model: "XYZ", name: "Alfred")
print(robot1.name) // Alfred
print(robot1.series) // 2
print(robot1.model) // XYZ

robot1.move() // moving...
robot1.setName(newName: "C2PO")
print(robot1.name) // C2P0

// Class
/* 
  Classes são tipos de referência. Isso significa que quando você cria uma instância de uma classe e a atribui a uma variável, você está na verdade passando uma referência (ou ponteiro) para o objeto na memória.
  A class tem um construtor (init) para inicializar os valores e um destrutor (deinit) que é chamado quando a instância é desalocada.
  A classe permite a mutabilidade dos seus atributos mesmo sem a palavra-chave mutating, porque as instâncias de classe são referenciadas e podem ser modificadas diretamente.
*/ 
class RobotClass {
    let series: Int
    let model: String
    var name: String
    
    init(series: Int, model: String, name: String) {
        self.series = series
        self.model = model
        self.name = name
    }
    
    deinit {
        print("Shutting down...")
    }
    
    func move() {
        print("moving...")
    }
}

var robot = RobotClass(series: 2, model: "QW", name: "ROOT5")
var reference = robot

robot.name = "Gil"
print(robot.name) // Gil
print(reference.name) // Gil (reflete)


// PROPERTIES
// Stored, lazy, computed, observers

class RobottClass {
    let series: Int   // Propriedade armazenada (constante)
    let model: String // Propriedade armazenada (constante)
    var name: String { // Propriedade armazenada (variável)
        willSet { // Observadores de propriedades
            print(newValue) // Pedro
            print(name) // Messi
        }
        didSet {
            print(oldValue) // Pedro
            print(name) // Messi
        }
    }
    

    var description: String {  // Propriedade computada (get)
        return "RobottClass\nSeries: \(self.series)\nModel: \(self.model)\nName: \(self.name)"
    }
    
    init(series: Int, model: String, name: String) {
        self.series = series
        self.model = model
        self.name = name
    }
    
    deinit {
        print("Shutting down...")
    }
    
    func move() {
        print("moving...")
    }
}

var robot3 = RobottClass(series: 10, model: "AFA", name: "Messi")
print (robot3.description)

robot3.name = "Pedro"

/*
Lazy: uma propriedade lazy é uma propriedade que não é inicializada até que seja acessada pela primeira vez.
Computed: não armazenam um valor diretamente. Em vez disso, calculam o valor quando são acessadas. A propriedade é definida com um getter e pode opcionalmente ter um setter.
Stored: são propriedades que armazenam valores diretamente. Elas podem ser constantes (let) ou variáveis (var).
Observers: permitem observar e reagir a mudanças em propriedades armazenadas. São definidos usando willSet e didSet.
*/