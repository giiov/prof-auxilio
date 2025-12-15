let histórico = [] //guarda a conversa do chat toda

document.getElementById("sendBtn").addEventListener("click", sendMessage);

function sendMessage() {
    const input = document.getElementById("userInput");
    const text = input.value.trim();
    if (text === "") return;

    addMessage(text, "user");

    //adiciona histórico
    histórico.push({role: "user", text: text});

    input.value = "";

    // Tecla Enter para enviar
document.getElementById("userInput").addEventListener("keypress", function(event) {
    if (event.key === "Enter") {
        enviarMensagem();
    }
});

    // ... dentro da função sendMessage() ...

    fetch("http://localhost/professor-auxilio/backend/chatIA/chat.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",},
        body: JSON.stringify({ pergunta:text, histórico: histórico })
    })
    .then(res => {
        // 1. Verificar se a resposta é OK (Status HTTP 200-299)
        if (!res.ok) {
            console.error("Resposta HTTP não OK, Status:", res.status);
            // Tenta ler o corpo da resposta como texto se não for OK
            return res.text().then(text => { throw new Error("Server response: " + text); });
        }
        
        // 2. Se for OK, tenta ler como JSON
        return res.json(); 
    })
    .then(data => {
        // Seu código original de sucesso
        console.log("Resposta JSON:", data);
        addMessage(data.resposta, "ai");
        histórico.push({role: "ai", text: data.resposta});
    })
    .catch(err => {
        console.error("Erro detalhado na requisição:", err);
        addMessage("Erro ao contactar o servidor. Verifique o console para detalhes.", "ai");
    });
// ...
}


function addMessage(text, sender) {
    const messagesDiv = document.getElementById("messages");

    const msg = document.createElement("div");
    msg.classList.add("message",sender);
    msg.innerHTML = marked.parse(text);

    messagesDiv.appendChild(msg);
    messagesDiv.scrollTop = messagesDiv.scrollHeight;
}

function mostrarDigitando() {
    const containerMensagens = document.getElementById("mensagens");
    
    // Remove indicador anterior se existir
    const indicadorAnterior = document.getElementById("indicador-digitacao");
    if (indicadorAnterior) {
        indicadorAnterior.remove();
    }
    
    const indicador = document.createElement("div");
    indicador.id = "indicador-digitacao";
    indicador.classList.add("indicador-digitacao", "ativo");
    indicador.innerHTML = `
        <div style="display: flex; align-items: center; gap: 8px;">
            <i class="fas fa-robot" style="color: var(--azul-marinho);"></i>
            <span>TutorGuita está digitando<span class="pontos-digitacao">...</span></span>
        </div>
    `;
    
    containerMensagens.appendChild(indicador);
    containerMensagens.scrollTop = containerMensagens.scrollHeight;
}

function esconderDigitando() {
    const indicador = document.getElementById("indicador-digitacao");
    if (indicador) {
        indicador.remove();
    }
}

// Adiciona mensagem de boas-vindas inicial
window.addEventListener('load', function() {
    setTimeout(() => {
        const mensagemBoasVindas = `
# 👋 Olá! Eu sou o TutorGuita!

Sou seu assistente virtual do **Professor Auxílio** e estou aqui para ajudar você com conteúdos escolares!
**Como posso te ajudar hoje?**  
        `;
        
        addMessage(mensagemBoasVindas, "ia");
        histórico.push({ role: "ai", text: mensagemBoasVindas });
    }, 500);
});
