// Desafio das URLs

// Dado um array de URLs que estão utilizando o protocolo HTTP de maneira insegura, 
// você deve adicionar um "s" ao final de "http" para corrigir isso. 
// No entanto, cuidado, pois nem todos os links estão incorretos. 
// Após fazer as correções, crie uma nova variável chamada correctURLs contendo as strings corretas.

let urls = [
    "https://www.apple.com",
    "http://www.meusite.com.br",
    "http://www.bila.com",
    "https://www.ceara.com",
    "https://www.iphone.com"
]

var correctURLs = [String]()

for url in urls {
  if url.hasPrefix("http://"){
      correctURLs.append("https://" + url.dropFirst(7) )
  } else {
    correctURLs.append(url)
  }
}

print(correctURLs)