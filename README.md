# 🎓 Professor Auxílio

O Professor Auxílio é uma plataforma educacional desenvolvida para auxiliar estudantes do ensino fundamental e médio.

As ferramentas principais incluem:
* Chat com Inteligência Artificial (**TutorGuita**)
* Gerador de simulados baseado na **BNCC**
* Organização de conteúdos
* Interface intuitiva e acessível

> Projeto desenvolvido por alunos do curso **AMS / Informática para Internet**, com foco em acessibilidade e didática.

---

## 🛠️ Funcionalidades e Tecnologias

### 💡 Funcionalidades Principais

| Recurso | Descrição |
| :--- | :--- |
| **🤖 Chat TutorGuita (IA)** | Responde dúvidas escolares seguindo regras pedagógicas (explicação passo a passo, incentivo ao raciocínio). Mantém histórico e utiliza a API Gemini. |
| **📝 Gerador de Simulados** | Gera automaticamente um simulado (12 questões) com base na matéria e série informada pelo usuário, seguindo padrões da BNCC. Oferece download em PDF. |
| **🧩 Mapa Mental Interativo** | Permite organizar ideias, criar resumos e estudar de forma visual e dinâmica, com criação de nós, função de arrastar/soltar, conexão automática e exportação para PNG. |


### 💻 Tecnologias Utilizadas

| Componente | Tecnologias |
| :--- | :--- |
| **Frontend** | `HTML`, `CSS`, `JavaScript` |
| **Backend** | `PHP`, `Integração com API Gemini (Google)` |

---

## ▶️ Como Rodar o Projeto Localmente
Siga os passos para configurar o ambiente (XAMPP, Laragon, WAMP):

### 1️⃣ Clonar o Repositório
``bash
git clone https://github.com/SEU-USUARIO/professor-auxilio.git

### 2️⃣ Mover para o Servidor Local
Coloque a pasta do projeto dento do diretório do servidor:
Exemplo (Laragon):
C:\laragon\www\professor-auxilio

### 3️⃣ Criar o Arquivo .env
na raiz do projeto, crie um arquivo .en, baseado no .env.example

### 4️⃣ Acessar o projeto
Acesse no navegador:
[text](http://localhost/professor-auxilio)

### 📌 Observações Importantes
* Este projeto não funciona sem as chaves da API Gemini
* As respostas da IA podem variar conforme disponibilidade do modelo
* Em caso de erro como “model is overloaded”, basta tentar novamente após alguns instantes