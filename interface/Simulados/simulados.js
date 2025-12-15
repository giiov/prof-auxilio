// VARIÁVEIS GLOBAIS - PORTUGUÊS
let dadosSimulado = null; //armazena o JSON completo do simulado (incluindo respostas corretas)

// FUNÇÃO PRINCIPAL: GERAR SIMULADO
document.getElementById("gerar-simulado").addEventListener("click", async () => {
    // coleta dados e elementos DOM
    const materia = document.getElementById("materia").value;
    const serie = document.getElementById("serie").value;
    const resultado = document.getElementById("resultado-simulado");
    const loader = document.getElementById("loader-simulado");

    // prepara interface
    loader.classList.add("show");
    resultado.innerHTML = ''; // limpa resultados anteriores
    document.getElementById("pdf-simulado").style.display = "none"; // esconde PDF

    // Validação dos campos
    if (!materia || !serie) {
        loader.classList.remove("show");
        resultado.innerHTML = '<div class="mensagem erro">⚠️ Por favor, preencha a matéria e a série.</div>';
        return;
    }

    try {
        // CHAMADA À API (FETCH)
        const retorno = await fetch("../../backend/Simulados/gerarSimulado.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ materia, serie })
        });

        loader.classList.remove("show");

        // Se o retorno não for OK
        if (!retorno.ok) {
            const respostaBruta = await retorno.text();
            console.error("ERRO HTTP:", retorno.status, "Resposta Bruta (Servidor):", respostaBruta);
            throw new Error(`Erro no servidor (${retorno.status}). Tente novamente.`);
        }

        // TENTA OBTER O TEXTO
        const respostaTextual = await retorno.text();
        console.log("Resposta Bruta Recebida:", respostaTextual);

        let simuladoJson;

        try {
            // Tenta analisar o JSON principal
            const data = JSON.parse(respostaTextual); 
            
            const simuladoRaw = data.simulado;

            // limpeza markdown          
            const jsonLimpido = simuladoRaw
                .replace("```json\n", "") // Remove a abertura do bloco de código
                .replace("\n```", "")      // Remove o fechamento do bloco de código
                .trim();                 // Remove espaços extras

            // TENTA ANALISAR O JSON FINAL (o simulado real)
            simuladoJson = JSON.parse(jsonLimpido); 
            
            // verifica se a IA gerou o conteúdo principal esperado
            if (!simuladoJson.simulado) {
                resultado.innerHTML = '<div class="mensagem erro"> Erro: A estrutura do simulado não foi encontrada.</div>';
                return;
            }

            // armazena o JSON completo globalmente
            dadosSimulado = simuladoJson;
            
            // renderização do simulado
            renderizarSimulado(simuladoJson, materia, serie);
            
        } catch (e) {
            // se falhar o JSON.parse
            console.error("FALHA NO PARSE JSON:", e);

            const erroDisplay = `
                <div class="mensagem erro">
                    <h3><i class="fas fa-exclamation-triangle"></i> Erro de Formato</h3>
                    <p>O servidor não retornou um JSON válido. Verifique a configuração do backend.</p>
                </div>
            `;
            resultado.innerHTML = erroDisplay;
            return;
        }
        
    } catch (err) {
        // captura qualquer erro de fetch
        loader.classList.remove("show");
        resultado.innerHTML = `<div class="mensagem erro">Erro de Requisição: ${err.message}</div>`;
    }
});

// FUNÇÃO: RENDERIZAR SIMULADO INTERATIVO
function renderizarSimulado(simuladoData, materia, serie) {
    const resultado = document.getElementById("resultado-simulado");

    // cria cabeçalho e formulário
    let htmlContent = `
        <div class="conteudo-simulado">
            <h3 class="titulo-simulado"><i class="fas fa-file-alt"></i> Simulado de ${materia} — ${serie}</h3>
            <form id="simulado-form">
    `;

    // itera sobre cada questão no array 'questoes'
    simuladoData.simulado.forEach(questao => {
        htmlContent += `
            <div class="questao" data-id="${questao.id}">
                <p class="pergunta"><strong>${questao.id}.</strong> ${questao.pergunta}</p>
                <div class="alternativas">
        `;

        // itera sobre as alternativas e cria os inputs de rádio
        questao.alternativas.forEach((alt, index) => {
            // letra da alternativa (A, B, C, D)
            const letra = String.fromCharCode(65 + index);
            
            htmlContent += `
                <label class="rotulo-alternativa">
                    <input type="radio" name="questao-${questao.id}" value="${letra}">
                    ${letra}) ${alt}
                </label>
            `;
        });

        htmlContent += `
                </div>
            </div>
        `;
    });

    // botão de verificação
    htmlContent += `
            <button type="button" id="verificar-respostas" class="botao-verificacao">
                <i class="fas fa-check-circle"></i> Verificar Respostas e Obter Sugestão
            </button>
            <div id="feedback-final" class="feedback-final"></div>
            </form>
        </div>
    `;

    resultado.innerHTML = htmlContent;
    document.getElementById("pdf-simulado").style.display = "inline-block"; // Mostra o botão PDF

    // listener ao novo botão de verificação
    document.getElementById("verificar-respostas").addEventListener("click", verificarRespostas);
}

// FUNÇÃO: VERIFICAR RESPOSTAS E GERAR FEEDBACK
async function verificarRespostas() {
    // validação de dados
    if (!dadosSimulado || !dadosSimulado.simulado) {
        alert("Erro: O simulado não foi carregado corretamente.");
        return;
    }

    const questoes = dadosSimulado.simulado;
    let acertos = 0;
    const erros = []; // array para armazenar questões erradas
    const form = document.getElementById("simulado-form");
    const feedbackDiv = document.getElementById("feedback-final");

    feedbackDiv.innerHTML = `
        <div class="mensagem">
            <i class="fas fa-spinner fa-spin"></i> Verificando suas respostas...
        </div>
    `;

    // limpar e colorir as questões (visual do feedback)
    document.querySelectorAll('.questao').forEach(q => q.classList.remove('correta', 'incorreta'));

    // loop de verificação
    questoes.forEach(questao => {
        // encontra a alternativa marcada pelo aluno para esta questão
        const inputSelecionado = form.querySelector(`input[name="questao-${questao.id}"]:checked`);
        
        // verifica se o aluno selecionou algo
        if (inputSelecionado) {
            const respostaAluno = inputSelecionado.value;
            
            // compara com a resposta correta armazenada no JSON
            if (respostaAluno === questao.resposta_correta) {
                acertos++;
                // adiciona classe para pintar a questão de verde
                document.querySelector(`.questao[data-id="${questao.id}"]`).classList.add('correta');
            } else {
                // adiciona classe para pintar a questão de vermelho
                document.querySelector(`.questao[data-id="${questao.id}"]`).classList.add('incorreta');
                erros.push(questao.id); // registra o erro
            }
        } else {
            // se não marcou, considera como erro
            erros.push(questao.id);
            document.querySelector(`.questao[data-id="${questao.id}"]`).classList.add('incorreta');
        }
    });

    // contagem de erros e acertos
    const totalQuestoes = questoes.length;
    const materia = document.getElementById("materia").value;
    const serie = document.getElementById("serie").value;

    // chama a API de feedback
    try {
        const retornoFeedback = await fetch("../../backend/Simulados/gerarFeedback.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ 
                acertos: acertos, 
                total: totalQuestoes, 
                materia: materia,
                serie: serie
            })
        });

        // tenta obter o JSON
        const dataFeedback = await retornoFeedback.json();

        // exibir resultado final e feedback
        const feedbackTexto = dataFeedback.feedback || "Não foi possível gerar a sugestão da IA.";

        feedbackDiv.innerHTML = `
            <div class="feedback-final">
                <h3 class="titulo-feedback"><i class="fas fa-chart-line"></i> Resultado Final: ${acertos}/${totalQuestoes} Acertos</h3>
                <div class="sugestao-ia">
                    <strong><i class="fas fa-robot"></i> Sugestão do Professor IA:</strong><br>
                    ${feedbackTexto}
                </div>
            </div>
        `;

    } catch (e) {
        // se a requisição de feedback falhar
        feedbackDiv.innerHTML = `
            <div class="mensagem erro">
                <i class="fas fa-exclamation-circle"></i> Erro ao obter sugestão da IA.
            </div>
        `;
    }
}

// FUNÇÃO: GERAR PDF (mantida como estava)
document.getElementById("pdf-simulado").addEventListener("click", () => {
    const { jsPDF } = window.jspdf;
    const elemento = document.querySelector(".conteudo-simulado");
    
    if (!elemento) {
        alert("⚠️ Gere o simulado primeiro!");
        return;
    }

    html2canvas(elemento, { scale: 2 }).then((canvas) => {
        const imgData = canvas.toDataURL("image/png");
        const pdf = new jsPDF("p", "mm", "a4");

        const pdfWidth = pdf.internal.pageSize.getWidth();
        const pdfHeight = pdf.internal.pageSize.getHeight();
        const margin = 10;

        const imgPdfWidth = pdfWidth - (2 * margin);
        const imgPdfHeight = (canvas.height * imgPdfWidth) / canvas.width;

        let heightLeft = imgPdfHeight;
        let currentY = margin;

        const title = "Simulado - Professor Auxílio";
        pdf.setFontSize(16);
        pdf.text(title, margin, margin + 5);

        currentY = margin + 15;

        pdf.addImage(imgData, "PNG", margin, currentY, imgPdfWidth, imgPdfHeight);
        heightLeft -= (pdfHeight - currentY - margin);

        let position = currentY - (pdfHeight - 2 * margin);

        while (heightLeft > 0) {
            pdf.addPage();
            pdf.addImage(imgData, "PNG", margin, position, imgPdfWidth, imgPdfHeight);
            heightLeft -= (pdfHeight - 2 * margin);
            position -= (pdfHeight - 2 * margin);
        }

        pdf.save("simulado-professor-auxilio.pdf");
    });
});