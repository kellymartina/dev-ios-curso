// PROTOCOLS E EXTENSIONS

/*
 Em Swift, protocols e extensions são conceitos fundamentais que ajudam a organizar e estruturar o código.
 Protocols (protocolos) são um tipo de abstração que define um conjunto de métodos, propriedades e requisitos que uma classe, struct ou enum deve implementar. Eles permitem definir interfaces que diferentes tipos podem adotar, garantindo que esses tipos implementem certas funcionalidades.
 */

protocol Greetable {
    func greet() -> String
}

struct Person: Greetable {
    var name: String
    
    func greet() -> String {
        return "Hello, my name is \(name)."
    }
}

let person1 = Person(name: "Alice")
print(person1.greet()) // Saída: "Hello, my name is Alice."


/*
 Extensions (extensões) permitem adicionar novos comportamentos a tipos existentes, como classes, structs, enums e protocolos, sem precisar alterar o código original desses tipos. Elas são usadas para adicionar métodos, propriedades computadas, inicializadores e conformidades de protocolo a tipos existentes.
 */

extension Person {
    func introduction() -> String {
        return "Hi, I'm \(name). Nice to meet you!"
    }
}

let person2 = Person(name: "Bob")
print(person2.introduction()) // Saída: "Hi, I'm Bob. Nice to meet you!"

// No exemplo acima, a extensão adiciona um novo método introduction à struct Person sem modificar o código original da struct.


/* Resumo
Protocols definem um conjunto de métodos e propriedades que um tipo deve implementar.
Extensions permitem adicionar novos comportamentos a tipos existentes, sem modificar o código original desses tipos.
*/
