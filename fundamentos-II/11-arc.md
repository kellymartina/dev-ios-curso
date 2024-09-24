## ARC
Ferramenta para gerenciar a alocação de memória dentro do ambiente de desenvolvimento <br>
"Enquanto houver pelo menos uma referência para um objeto, ele continuará em memória"
 
### Weak vs Strong
Todas as referências no Swift são por padrão Strong (não permite que o objeto referenciado seja desalocado)
- Quando utilizamos STRONG  a referência é contabilizada pelo ARC
- Quando utilizamos WEAK a referência NÃO é contabilizada pelo ARC 
OBS: Como quando usamos weak a referência não é contada, há a possibilidade dela ser desalocada a qualquer momento, por isso ela precisa ser uma Optional

```swift
import Foundation

class Parent {
    var child: Child? {
        didSet{ // exibir mensagens sempre que houver mudanças nessas referências
            print("New child")
        }
    }
    
    deinit { // imprimir uma mensagem quando as instâncias forem desalocadas.
        print("Parent deinit")
    }
    
}

class Child {
    var parent: Parent?{
        didSet{
            print("New parent")
        }
    }
    
    deinit {
        print("Child deinit")
    }
}

var parent: Parent? = Parent() // parent é uma instância da classe Parent.
var child: Child? = Child() // child é uma instância da classe Child.
/* Neste ponto, as duas instâncias referenciam uma à outra. Isso cria um ciclo de retenção
se você não usar weak para evitar que o ARC (Automatic Reference Counting) consiga desalocar 
essas instâncias. */

parent?.child = child // O parent tenha uma referência para child (parent.child = child).
child?.parent = parent // O child tenha uma referência para parent (child.parent = parent).

parent = nil
child = nil
/* Aqui, você está definindo as variáveis parent e child como nil. Mas, como essas duas 
instâncias têm fortes referências entre si, as instâncias não serão desalocadas da memória,
e os métodos deinit não serão chamados. */
```

### Retain Cycles
Ocorre quando duas instâncias possuem referências fortes de uma para a outra, impedindo que o ARC as remova da memória <br>
Para resolver é adicionar weak em uma das classes:
```swift
class Parent {
    let name: String
    weak var child: Child
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Parent \(name) foi desinstanciada")
    }
}
```