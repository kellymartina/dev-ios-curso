/* 
DESAFIO 1
Escreva uma função chamada somar que receba dois inteiros opcionais. A função deve retornar nil caso um dos valores seja nil. 
Caso ambos os valores sejam fornecidos, a função deve retornar a soma desses dois inteiros.
*/

func soma (_ a: Int?, _ b: Int?) -> Int? {
    if a == nil || b == nil {
        return nil
    } else {
        return a! + b!
    }
}

print(soma(3, 4))  // Saída: 7
print(soma(nil, 4))  // Saída: nil

// Em Swift, ! é o operador de force unwrapping (desempacotamento forçado). 
// Ele é usado quando você tem a certeza de que um valor opcional contém um valor e não é nil


/* 
DESAFIO 2
Crie uma função chamada filtrarArray que filtre os elementos de um array de inteiros utilizando closures. 
A função deve receber como parâmetros um array de inteiros e uma closure que sirva como critério de filtro. 
A função deve retornar um novo array contendo apenas os elementos que satisfazem a condição imposta pela closure.
*/


func filtrarArray(_ array: [Int], usandoFiltro filtro: (Int) -> Bool) -> [Int] {
    var resultado: [Int] = []
    for valor in array {
        if filtro(valor) {
            resultado.append(valor)
        }
    }
    return resultado
}
// Exemplo de uso
let numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let filtrados = filtrarArray(numeros) { $0 % 2 == 0 }  // Filtra os números pares
print(filtrados)  // Saída: [2, 4, 6, 8, 10]

/* usandoFiltro filtro: (Int) -> Bool: É uma closure que serve como critério de filtragem. 
Ela recebe um inteiro como argumento e retorna um valor Bool. 
Se a closure retornar true para um determinado valor, esse valor será adicionado ao array filtrado; caso contrário, será ignorado. */


