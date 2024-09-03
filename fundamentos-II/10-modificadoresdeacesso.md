### Open
O nível de acesso mais permissivo. Permite que classes e métodos sejam usados e sobrescritos fora do módulo (por exemplo, em outro framework ou projeto). Também permite que classes sejam herdadas fora do módulo. 
### Public
Permite que classes, métodos e propriedades sejam usados fora do módulo (framework ou projeto), mas classes não podem ser herdadas e métodos não podem ser sobrescritos fora do módulo.
### Internal 
É o nível de acesso padrão em Swift. Permite que classes, métodos e propriedades sejam usados dentro do mesmo módulo, mas não fora dele. Este modificador é útil quando você deseja limitar o uso de código apenas ao projeto atual.
### Fileprivate
Restringe o uso de classes, métodos e propriedades ao mesmo arquivo de código fonte. Mesmo que duas classes estejam no mesmo módulo, elas não poderão acessar membros fileprivate uma da outra se estiverem em arquivos diferentes.
### Private
Restringe o uso ao mesmo escopo (dentro da mesma classe, estrutura ou enumeração). Propriedades ou métodos marcados como private não podem ser acessados fora da classe ou estrutura em que foram declarados, nem mesmo em extensões da mesma classe no mesmo arquivo.
<br>
## Exemplo

```swift
public class PublicClass {
    public var publicProperty = 0
    var internalProperty = 0 // acesso internal por padrão
    private func privateMethod() {}
}

class InternalClass {
    var internalProperty = 0
    fileprivate func fileprivateMethod() {}
    private func privateMethod() {}
}
```

Obs: Em Swift, cada aplicativo ou biblioteca é considerado um módulo. Por exemplo, quando você cria um aplicativo iOS ou uma biblioteca/framework, isso é tratado como um módulo.
