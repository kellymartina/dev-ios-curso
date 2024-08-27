// String

var name: String = "Pedro"
var test = String()
var txt = ""

var txt2 = #" text \n text "# //não vai quebrar a linha

var longText = "text text text \n text text"

var label = """
text text text text text \
text text text
text
"""

// Controle de fluxo - Estruturas de repeticao

// for-in
// let list = [0, 1, 2, 3]
for number in 0...10 {
    print(number)
}

// while
var num = 0
while num < 10 {
    print(num)
    num += 1
}

// repeat-while
repeat{
    print(num)
    num += 1
} while (num < 10)


// Controle de fluxo - Estruturas de condicionais

// if-else
var isOn = false
num = 64

if isOn {
    print("ligado")
} else {
    print("desligado")
}


if num >= 18 && num <= 60 {
    print("maior de idade")
} else if num > 60 {
    print ("aposentado")
} else {
    print ("menor de idade")
}

// switch (todos os casos possíveis)
var code = 494
switch code {
case 0...100:
    print("code between 0 and 100")
case 140, 150, 160:
    print("new code")
default:
    print("another code")
}

// Optionals: permitem que as variáveis não tenham valor
var age: Int?
print(age) // retorna "nil"

// Manipulação de Strings
var nome = "Pedro Rodrigues"

//for letter in nome {
//    print (letter)
//}

if let index = nome.firstIndex(of: " ") {
    let after = nome.index(after: index) // Define o segundo nome
    
    var firstName = String(nome[...index])
    var lastName = String(nome[after...])
    
    print(firstName) // Pedro
    print(lastName) // Rodrigues
}