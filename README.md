# 🛏️ Colchonet

Aplicação web desenvolvida em **Ruby on Rails** inspirada em plataformas de hospedagem, permitindo que usuários anunciem acomodações, visualizem quartos disponíveis e publiquem avaliações.

O projeto foi desenvolvido com foco no aprendizado das principais funcionalidades do ecossistema Rails, aplicando boas práticas de desenvolvimento, arquitetura MVC, autenticação de usuários, documentação de APIs e testes automatizados.

---

## 🚀 Tecnologias

* Ruby
* Ruby on Rails
* MySQL
* Docker
* RSpec
* Rswag (Swagger/OpenAPI)
* FriendlyId
* CarrierWave
* Importmap
* HTML/CSS

---

## ✨ Funcionalidades

* Cadastro e autenticação de usuários
* Confirmação de conta por e-mail
* Cadastro de acomodações
* Upload de imagens
* Slugs amigáveis com FriendlyId
* Avaliações de acomodações
* Relacionamentos entre usuários, quartos e avaliações
* APIs REST documentadas com Swagger
* Testes automatizados utilizando RSpec

---

## 📁 Estrutura do projeto

O projeto segue a arquitetura **MVC (Model-View-Controller)** do Ruby on Rails.

Entre os componentes implementados estão:

* Controllers responsáveis pelas regras de fluxo
* Models com validações e relacionamentos
* Presenters para organização da camada de apresentação
* Uploaders para gerenciamento de imagens
* Mailers para envio de e-mails
* Testes de integração e de modelos
* Documentação da API utilizando OpenAPI/Swagger

---

## ⚙️ Como executar o projeto

### Clonar o repositório

```bash
git clone https://github.com/raphaelcampean/colchonet1.git
cd colchonet1
```

### Instalar as dependências

```bash
bundle install
```

### Configurar o banco

```bash
rails db:create
rails db:migrate
rails db:seed
```

### Executar a aplicação

```bash
rails server
```

A aplicação ficará disponível em:

```
http://localhost:3000
```

---

## 🧪 Executando os testes

```bash
bundle exec rspec
```

---

## 📖 Documentação da API

O projeto utiliza **Rswag** para documentação das APIs seguindo o padrão OpenAPI.

Após iniciar a aplicação, a documentação pode ser acessada pela interface Swagger.

---

## 📦 Deploy

O projeto contém configuração para deploy utilizando **Render**, incluindo o arquivo `render.yaml`.

---

## 📚 Principais conceitos praticados

* Ruby on Rails
* Active Record
* Associações entre modelos
* Validações
* Migrations
* RESTful APIs
* Upload de arquivos
* Autenticação
* Testes automatizados
* Documentação de APIs
* Docker
* Versionamento com Git

---

## 👨‍💻 Autor

**Raphael Campean da Silva**

* GitHub: https://github.com/raphaelcampean
* LinkedIn: https://www.linkedin.com/in/raphael-campean-31a826270/
