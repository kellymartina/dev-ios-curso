// GENERICS

// Exemplo 1

func swap(_ num1: inout Int, _ num2: inout Int) { // funcão que troca os valores de duas variáveis
    let tmp = num1
    num1 = num2
    num2 = tmp
}

var num1: Int = 10
var num2: Int = 20

print (num1, num2) // Output: 10 20

swap(&num1, &num2)

print (num1, num2) // Output: 20 10
// Como fazer com que esse código aceite outros tipos de dados (String, double) sem criar outra func

func swap2<T>(_ value1: inout T, _ value2: inout T) { // Parâmetro genérico T: pode ser substituído por qualquer tipo, como String, Double ou qualquer outro tipo de dado
    let tmp2 = value1
    value1 = value2
    value2 = tmp2
}

// Testando com Strings
var str1 = "A"
var str2 = "B"

print (str1, str2) // Output: A B

swap2(&str1, &str2)

print (str1, str2) // Output: B A

// inout: Os parâmetros value1 e value2 são marcados como inout, o que significa que a função pode modificar diretamente os valores passados. O operador & deve ser usado ao chamar a função para indicar que está passando referências.



// Exemplo 2

func swapp<T>(_ value1: inout T, _ value2: inout T) {
    let tmp2 = value1
    value1 = value2
    value2 = tmp2
}

// A estrutura Stack implementa uma pilha (stack), que é uma estrutura de dados onde os elementos seguem a regra LIFO (Last In, First Out). Em outras palavras, o último elemento a ser inserido é o primeiro a ser removido.
struct Stack<T> {
    private(set) var elements: [T] = [] // // O modificador private(set) permite que apenas métodos da própria estrutura modifiquem elements, mas ele ainda pode ser lido de fora
    
    mutating func push(_ element: T) { // método que insere um novo elemento na pilha, adicionando-o ao final do array.
        self.elements.append(element)
    }
    
    @discardableResult mutating func pop() -> T { // método que remove o último elemento inserido (o topo da pilha) e retorna esse valor
        return self.elements.removeLast() // @discardableResult: Esse atributo permite ignorar o valor de retorno de pop se ele não for usado, evitando warnings no compilador.

    }
}

var stack = Stack<Int>() // Pode ser qualquer outro.

print(stack.elements) // Saída: []
stack.push(10)
print(stack.elements) // Saída: [10]
stack.push(20)
print(stack.elements) // Saída: [10, 20]
print(stack.pop()) // Saída: 20
print(stack.elements) // Saída: [10]



// Exemplo 3 (com restrição)

func sum<T: Numeric> (_ num1: T, _ num2: T) -> T { // Precisa colocar restrição porque apenas conseguimos somar valores númericos
    return num1 + num2
}



