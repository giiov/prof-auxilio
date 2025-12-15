// VARIÁVEIS GLOBAIS
let bolhaSelecionada = null;
let linhas = [];

// BOTÃO ADICIONAR BOLHA
document.getElementById("botaoNovaBolha").addEventListener("click", () => {
    criarBolha();
});

// BOTÕES ADICIONADOS
document.getElementById("botaoSalvar").addEventListener("click", salvarMapa);
document.getElementById("botaoCarregar").addEventListener("click", carregarMapa);
document.getElementById("botaoExportar").addEventListener("click", exportarMapa);
document.getElementById("botaoLimpar").addEventListener("click", limparMapa);
document.getElementById("botaoAjuda").addEventListener("click", mostrarAjuda);

// FECHAR MODAL
document.querySelectorAll(".fechar-modal, .overlay-modal").forEach(el => {
    el.addEventListener("click", fecharAjuda);
});

// CRIAR BOLHA
function criarBolha() {
    const canvas = document.getElementById("canvas");
    
    const bolha = document.createElement("div");
    bolha.classList.add("bolha");
    bolha.contentEditable = true;
    bolha.innerText = "Nova Ideia";
    
    // Posição centralizada no canvas visível
    const rect = canvas.getBoundingClientRect();
    const x = (rect.width / 2) - 70;
    const y = (rect.height / 2) - 25;
    
    bolha.style.left = x + "px";
    bolha.style.top = y + "px";

    tornarArrastavel(bolha);

    bolha.addEventListener("click", (e) => {
        e.stopPropagation();

        if (bolhaSelecionada === null) {
            // Primeiro clique: seleciona
            bolhaSelecionada = bolha;
            bolha.classList.add("selecionada");
            mostrarStatus("Bolha selecionada! Agora clique em outra bolha para conectar.");
            
        } else if (bolhaSelecionada !== bolha) {
            // Segundo clique: conecta
            conectarBolhas(bolhaSelecionada, bolha);
            bolhaSelecionada.classList.remove("selecionada");
            bolhaSelecionada = null;
            mostrarStatus("Bolhas conectadas com sucesso!");
        }
    });
    
    // Focar e selecionar texto ao criar
    bolha.addEventListener("focus", function() {
        if (this.innerText === "Nova Ideia") {
            const range = document.createRange();
            const selecao = window.getSelection();
            range.selectNodeContents(this);
            selecao.removeAllRanges();
            selecao.addRange(range);
        }
    });

    canvas.appendChild(bolha);
    mostrarStatus("Nova ideia criada! Clique para editar o texto.");
    
    // Focar automaticamente no texto
    setTimeout(() => {
        bolha.focus();
    }, 50);
}

// FUNÇÃO PARA ARRASTAR BOLHAS
function tornarArrastavel(el) {
    let offsetX = 0, offsetY = 0;

    el.addEventListener("mousedown", (e) => {
        offsetX = e.clientX - el.offsetLeft;
        offsetY = e.clientY - el.offsetTop;

        function aoMoverMouse(e) {
            el.style.left = e.clientX - offsetX + "px";
            el.style.top = e.clientY - offsetY + "px";

            linhas.forEach(l => l.position());
        }

        document.addEventListener("mousemove", aoMoverMouse);

        document.addEventListener("mouseup", () => {
            document.removeEventListener("mousemove", aoMoverMouse);
            mostrarStatus("Bolha movida para nova posição");
        }, { once: true });
    });
}

// CONECTAR BOLHAS
function conectarBolhas(a, b) {
    const linha = new LeaderLine(a, b, {
        color: "#2ba0b7", // azul-marinho da paleta
        size: 3,
        container: document.getElementById("canvas")
    });

    linhas.push(linha);
}

// ========== FUNÇÕES ADICIONAIS ==========

// SALVAR MAPA
function salvarMapa() {
    const bolhas = Array.from(document.querySelectorAll('.bolha')).map(bolha => ({
        texto: bolha.innerText,
        x: bolha.style.left,
        y: bolha.style.top
    }));
    
    const mapa = {
        bolhas: bolhas,
        data: new Date().toLocaleString('pt-BR')
    };
    
    localStorage.setItem('professor-auxilio-mapa', JSON.stringify(mapa));
    mostrarStatus("Mapa salvo localmente! Pode carregar depois.", 2000);
}

// CARREGAR MAPA
function carregarMapa() {
    const salvo = localStorage.getItem('professor-auxilio-mapa');
    if (!salvo) {
        mostrarStatus("Nenhum mapa salvo encontrado no seu navegador");
        return;
    }
    
    if (!confirm("Carregar mapa salvo? O mapa atual será perdido.")) {
        return;
    }
    
    // Limpar primeiro
    document.querySelectorAll('.bolha').forEach(bolha => bolha.remove());
    linhas.forEach(linha => linha.remove());
    linhas = [];
    bolhaSelecionada = null;
    
    const mapa = JSON.parse(salvo);
    
    // Recriar bolhas
    mapa.bolhas.forEach(dadosBolha => {
        const bolha = document.createElement("div");
        bolha.classList.add("bolha");
        bolha.contentEditable = true;
        bolha.innerText = dadosBolha.texto;
        bolha.style.left = dadosBolha.x;
        bolha.style.top = dadosBolha.y;
        
        document.getElementById("canvas").appendChild(bolha);
        tornarArrastavel(bolha);
        
        // Adicionar evento de clique
        bolha.addEventListener("click", (e) => {
            e.stopPropagation();

            if (bolhaSelecionada === null) {
                bolhaSelecionada = bolha;
                bolha.classList.add("selecionada");
            } else if (bolhaSelecionada !== bolha) {
                conectarBolhas(bolhaSelecionada, bolha);
                bolhaSelecionada.classList.remove("selecionada");
                bolhaSelecionada = null;
            }
        });
    });
    
    mostrarStatus(`Mapa carregado! Criado em: ${mapa.data}`, 3000);
}

// EXPORTAR MAPA
function exportarMapa() {
    const canvas = document.getElementById('canvas');
    
    domtoimage.toPng(canvas)
        .then(function (dataUrl) {
            const link = document.createElement('a');
            link.download = `mapa-mental-${new Date().toISOString().slice(0,10)}.png`;
            link.href = dataUrl;
            link.click();
            mostrarStatus("Mapa exportado como imagem PNG!", 2000);
        })
        .catch(function (error) {
            console.error('Erro ao exportar:', error);
            mostrarStatus("Erro ao exportar. Tente novamente.");
        });
}

// LIMPAR MAPA
function limparMapa() {
    if (document.querySelectorAll('.bolha').length === 0) {
        mostrarStatus("O mapa já está vazio!");
        return;
    }
    
    if (confirm("Tem certeza que deseja limpar TODO o mapa? Esta ação não pode ser desfeita.")) {
        document.querySelectorAll('.bolha').forEach(bolha => bolha.remove());
        linhas.forEach(linha => linha.remove());
        linhas = [];
        bolhaSelecionada = null;
        mostrarStatus("Mapa limpo! Comece novamente.", 2000);
    }
}

// MOSTRAR AJUDA
function mostrarAjuda() {
    document.getElementById('modalAjuda').classList.add('ativo');
    document.getElementById('overlayModal').classList.add('ativo');
}

// FECHAR AJUDA
function fecharAjuda() {
    document.getElementById('modalAjuda').classList.remove('ativo');
    document.getElementById('overlayModal').classList.remove('ativo');
}

// MOSTRAR STATUS
function mostrarStatus(mensagem, tempo = 3000) {
    const indicador = document.getElementById('indicadorStatus');
    indicador.textContent = mensagem;
    indicador.classList.add('ativo');
    
    setTimeout(() => {
        indicador.classList.remove('ativo');
    }, tempo);
}

// TECLAS DE ATALHO
document.addEventListener('keydown', function(e) {
    // Ctrl+S para salvar
    if (e.ctrlKey && e.key === 's') {
        e.preventDefault();
        salvarMapa();
    }
    
    // Ctrl+N para nova bolha
    if (e.ctrlKey && e.key === 'n') {
        e.preventDefault();
        criarBolha();
    }
    
    // Delete para remover bolha selecionada
    if (e.key === 'Delete' && bolhaSelecionada) {
        if (confirm("Remover esta bolha e suas conexões?")) {
            // Remover linhas conectadas a esta bolha
            linhas = linhas.filter(linha => {
                if (linha.start === bolhaSelecionada || linha.end === bolhaSelecionada) {
                    linha.remove();
                    return false;
                }
                return true;
            });
            
            bolhaSelecionada.remove();
            bolhaSelecionada = null;
            mostrarStatus("Bolha removida!");
        }
    }
    
    // Esc para cancelar seleção
    if (e.key === 'Escape' && bolhaSelecionada) {
        bolhaSelecionada.classList.remove("selecionada");
        bolhaSelecionada = null;
        mostrarStatus("Seleção cancelada");
    }
});

// Criar primeira bolha quando a página carregar
window.addEventListener('load', function() {
    setTimeout(() => {
        criarBolha();
    }, 1000);
});
