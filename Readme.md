# Bankmarket

Simples aplicação que lista de conteudo e permite vizualizar alguns detalhes ao selecionar algum item.

## Preview

### Modo Light e Dark aplicados: 
<p float="left">
<kbd><img src="./readmefiles/light-ptbr.png" width="149"/></kbd>
<kbd><img src="./readmefiles/dark-ptbr.png" width="149"/></kbd>
<p>

---

### Internacionalização aplicada em Português e Inglês:

<p float="left">
<kbd><img src="./readmefiles/pt-br.png" width="149"/></kbd>
<kbd><img src="./readmefiles/en-us.png" width="149"/></kbd>
<p>

## Preparando o Ambiente

Para instalar e utilizar os recursos deste projeto, siga os passos abaixo.

Sobre o projeto: <br>
- Xcode Version 14.3 (14E222b) (ou superior)<br>
- Suporte mínimo ao iOS 10<br>
- Swift 5<br>
- Cobertura de código: 0%

Ferramentas de Gestão e Qualidade de Código<br>
- Fastlane
- Xcov
- Jazzy
- Swiftlint
- Swift Snapshot Testing

Gerenciador de Dependências<br>
- Swift Package Manager

## Instruções para Execução de Projeto

Foi utilizado a versão do Ruby 2.7.0 no uso das ferramentas de gestão e qualidade.

---

### [RVM](https://rvm.io/)

Instale o RVM com o seguinte comando: <br>

```\curl -sSL https://get.rvm.io | bash -s stable```

Após a instalação, utilize o seguinte comando para usar a versão 2.7.0 do Ruby:

```rvm install 2.7.0```

Depois use o comando: <br>
```rvm use 2.7.0```

---

### [BREW](https://brew.sh/)

Instale o brew com o seguinte comando: <br>
```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```

---
### Instalando dependencias de Gestão

Após instalados o RVM com a versão indicada do Ruby, e a instalação do Brew, execute os seguintes comandos

```brew bundle```

Irá instalar as dependencias listadas no arquivo `Brewfile`.

Após a conclusão das instalaçoes feitas com brew, execute o comando a baixo para instalar as dependencias do Gemfile:

```bundle install```

---

### Instalação de Dependências do Projeto

No Xcode atualize as dependencias usando o Swift Package Manager

---

## Ferramentas de Gestão e CD/CI

### [Fastlane](https://docs.fastlane.tools/getting-started/ios/setup/)

Usado para automatizar tarefas como execucao de testes unitários, assinatura projetos e envio para Loja e Testflight.

No projeto, já possi alguns lanes básicos configurados. Para usa-los, execute um dos comandos abaixo:

- Check code style<br>
```fastlane ios lint_code```

- Create coverage report<br>
```fastlane ios coverage```

- Used by Development to keep code quality.<br>
```fastlane ios check_code``` ou ```fastlane check_code dev:true```

Ver mais no link: [Fastlane](https://fastlane.tools)

### [Jazzy](https://github.com/realm/jazzy)

Ferramenta para documentação de código

### [Xcov](https://github.com/fastlane-community/xcov)

Ferramenta para exibir de forma mais amigável informações de cobertura de código do projeto.

### [Swift Snapshot Testing](https://github.com/pointfreeco/swift-snapshot-testing)

Usado para registrar imagens de telas/componentes e detectar possiveis alteacoes de layout.

Por questões de padronizaão, foi adotado o `iPhone 14 Pro (16.4)` para criar/testar os componentes e telas. No Fastfile (arquivo do fastlane), foi definido esse device.

--- 

### Autor

Tiago Amaral iOS Developer.
<br>
- [Linkedin](https://www.linkedin.com/in/tiagoamaralios/)