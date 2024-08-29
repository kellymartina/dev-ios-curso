// ENUMS

enum Power: Int {
    case on = 1
    case off = 0
}

// RawValue

if let power = Power(rawValue: 10) {
    print(power.rawValue)
}

// Enum + Switch

/*
 Aqui, você define um enum chamado PlayerState com quatro possíveis estados: .attacking, .idle, .running, e .defending. Depois, você usa switch para executar ações com base no estado atual do jogador.
 */

var power: Power = .off
switch power {
case .on:
    print("Is On")
case .off:
    print("Is Off")
}

enum PlayerState: Int, CaseIterable {
    case attacking
    case idle
    case running
    case defending
}

var state = PlayerState.idle

switch state {
case .attacking, .idle:
    print("Player")
default:
    print("Do nothing")
}

// Caselterable:  permite que você acesse todos os casos de uma enumeração em forma de uma coleção

for state in PlayerState.allCases {
    print(state)
}

// Variáveis e Métodos

enum DevicePower: Int {
    case on = 1
    case off = 0
    
    mutating func toggle() {
        self = (self == .off) ? .on : .off //  Aqui, ele verifica se o valor atual (self) é .off. Se for, altera o valor para .on. Caso contrário, muda para .off. Em outras palavras, o método "inverte" o estado do enum.
    }
}

var devicePower: DevicePower = .off

print(devicePower) // off

devicePower.toggle()

print(devicePower) // on


// Associated Values: permite que casos de um enum tenham valores associados de tipos específicos

enum Sample {
    case sample1(Int, Int)
    case sample2(Double)
}

var sample = Sample.sample2(10) // Aqui, você cria uma variável sample e a inicializa com o caso sample2, associando a ele o valor 10.

// O switch é usado para verificar o valor de sample e "desestruturar" os valores associados, dependendo do caso.
switch sample {
case .sample1(let value1, let value2):
    print(value1, value2)
case .sample2(let value):
    print("Sample 2 \(value)")
}


// Fake Optionals: Um tipo customizado que simula o comportamento de opcionais, com dois estados: .none e .some(Wrapped).

enum FakeOptional<Wrapped>: ExpressibleByNilLiteral, CustomStringConvertible {
    case none
    case some(Wrapped)
    
    var description: String {
        switch self {
        case .none:
            return "nil"
        case .some(let wrapped):
            return "FakeOptional(\(wrapped))"
        }
    }
    
    init(nilLiteral: ()) {
        self = .none
    }
    
    init(_ wrapped: Wrapped) {
        self = .some(wrapped)
    }
}

var fake: FakeOptional<Int> = .none

print(fake)
