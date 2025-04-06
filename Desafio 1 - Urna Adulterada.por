programa {
  /*
    Objetivo:

    1.1) Primeiramente para se iniciar o programa deverá ser informada uma senha de acesso, cuja senha será: 2411. 
    Enquanto esta senha não for digitada corretamente o sistema não poderá ser inicializado;
    
    1.2) Deverá ser passada ao usuário a informação a seguir:
      1.2.1) Digite 1 para iniciar a votação ou 0 para encerrar a votação.
    
    1.3) Caso o usuário digite 1 o sistema deverá colher as seguintes informações:
      1.3.1) Solicitar ao eleitor que vote em seu candidato a Prefeito. 
      O sistema deverá ter cadastrado os seguintes candidatos a prefeito:
        - Herbert – número 90
        - Ribeiro – número 95
      
      1.3.2) Solicitar ao eleitor que vote em seu candidato a vereador. 
      O sistema deverá ter cadastrado os seguintes candidatos a vereador:
        - Barone – número 90000
        - Bidu – número 90999
        - Monteiro – número 95000
        - João Fera – número 95999

      1.3.3) O sistema deve dar a opção do usuário votar em branco ou nulo.

      1.3.4) Este processo deve ser repetido até o mesário digitar 0. Ou seja, o flag, para finalizar a votação.

      1.3.5) Encerrada a votação, ou seja, digitado 0 o sistema deverá imprimir na tela as seguintes informações
        1.3.5.1) O número de votos de cada candidato;
        1.3.5.2) O número de votos em branco;
        1.3.5.3) O número de votos nulos;
        1.3.5.4) O prefeito eleito.
        1.3.5.5) O vereador mais votado.
  */

  // Declaração de variáveis globais:
  inteiro usuarioLogado = -1
  inteiro totalVotos = 0
  logico sair = falso, logado = falso, apuracao = falso
  cadeia senhaDigitada = "", senhaAcesso = "2411"
  cadeia candidatosPrefeitos[2] = {
  	"90 - Herbert", 
  	"95 - Ribeiro"
  }
  cadeia candidatosVereadores[4] = {
  	"90000 - Barone", 
  	"90999 - Bidu", 
  	"95000 - Monteiro", 
  	"95999 - João Fera"
  }
  inteiro votosPrefeitos[2] = {0, 0}
  inteiro votosVereadores[4] = {0, 0, 0, 0}

  inteiro votosNulo = 0, votosBranco = 0
  real valorFlutuante = 0.4

  // Início do programa:
  funcao inicio() {
    
    boasVindas()

    enquanto(logado == falso e sair == falso){
 
      senhaDigitada = obterDadosDoUsuario()
 
      logado = autenticar(senhaDigitada)

      logadoNoSistema()
    }
    
  }

  // Função de boas vindas:
  funcao boasVindas(){

    escreva("----------------------------------\n")
    escreva("------ SISTEMA DE VOTAÇÃO --------\n")
    escreva("----------------------------------\n")
    escreva("\nOlá, seja bem vindo ao sistema!\n")
  }

  // Função para obter a senha do usuário:
  funcao cadeia obterDadosDoUsuario(){

    escreva("\nDigite a senha de acesso: ")
    leia(senhaDigitada)
    retorne senhaDigitada
  }

  // Função que verifica a autenticação do usuário:
  funcao logico autenticar(cadeia senha){

    se(senhaAcesso == senha){

      escreva("\nUsuário autenticado!\n")
      escreva("\n----------------------------------\n")
      retorne verdadeiro

    } senao {

      escreva("\nSenha incorreta!\n")
      escreva("\n----------------------------------\n")
      retorne falso
    }
  }

  // Função que exibe o menu inicial:
  funcao inteiro menuInicial(){
    inteiro opcao

    escreva("\n")
    escreva(" Escolha uma das opção abaixo:\n")
    escreva(" 1 - Iniciar votação\n")
    escreva(" 0 - Encerrar votação\n")
    escreva(" Opção: ")

    leia(opcao)

    retorne opcao
  }

  // Função que registra a opção do usuário no menu inicial:
  funcao logadoNoSistema(){
    inteiro opcao

    enquanto(logado){

      opcao = menuInicial()

      escolha(opcao){      

        caso 1: iniciarVotacao() pare
        
        caso 0: encerrarVotacao() pare
        
        caso contrario:
          escreva("Opção invalida")
          escreva("\n----------------------------------\n")
      }
    }
  }
  
  // Função que encerra a votação:
  funcao encerrarVotacao(){

    apuracaoVotos()

    escreva("\nSaindo do sistema...\n")

    logado = falso
    sair = verdadeiro
    
  }

  // Função que inicia a votação:
  funcao iniciarVotacao(){

    inteiro opcao
    
    opcao = menuPrefeitos()

    escolhaPrefeito(opcao)

    opcao = menuVereadores()

    escolhaVereador(opcao)
  }

  // Função que exibe o menu de prefeitos:
  funcao inteiro menuPrefeitos(){
    inteiro opcao

    escreva("\n")
    escreva(" Escolha o seu candidato a Prefeito:\n")
    escreva(" 90 - Herbert\n")
    escreva(" 95 - Ribeiro\n")
    escreva(" 1 - Branco\n")

    escreva(" Opção: ")
    leia(opcao)
    escreva("\n")

    retorne opcao
  }

  // Função que registra o voto do prefeito:
  funcao escolhaPrefeito(inteiro opcao){
    
    totalVotos++
    escolha(opcao){

      caso 90: 
        escreva("Votou em Herbert\n") 
        votosPrefeitos[0] = votosPrefeitos[0] + 1
        pare

      caso 95: 
        escreva("Votou em Ribeiro\n") 
        votosPrefeitos[1] = votosPrefeitos[1] + 1
        pare
      
      caso 1: 
        escreva("Votou em Branco\n") 
        votosBranco = votosBranco + 1
        pare

      caso contrario:
        escreva("Votou Nulo\n")
        votosNulo = votosNulo + 1
    }
  }

  // Função que exibe o menu de vereadores:
  funcao inteiro menuVereadores(){
    inteiro opcao

    escreva("\n")
    escreva(" Escolha o seu candidato a Vereador:\n")
    escreva(" 90000 - Barone\n")
    escreva(" 90999 - Bidu\n")
    escreva(" 95000 - Monteiro\n")
    escreva(" 95999 - João Fera\n")
    escreva(" 1 - Branco\n")

    escreva(" Opção: ")
    leia(opcao)
    escreva("\n")

    retorne opcao
  }

  // Função que registra o voto do vereador:
  funcao escolhaVereador(inteiro opcao){
    
    totalVotos++
    escolha(opcao){

      caso 90000: 
        escreva("Votou em Barone\n") 
        votosVereadores[0] = votosVereadores[0] + 1
        pare

      caso 90999: 
        escreva("Votou em Bidu\n") 
        votosVereadores[1] = votosVereadores[1] + 1
        pare

      caso 95000: 
        escreva("Votou em Monteiro\n") 
        votosVereadores[2] = votosVereadores[2] + 1
        pare

      caso 95999: 
        escreva("Votou em João Fera\n") 
        votosVereadores[3] = votosVereadores[3] + 1
        pare
      
      caso 1: 
        escreva("Votou em Branco\n") 
        votosBranco = votosBranco + 1
        pare

      caso contrario:
        escreva("Votou Nulo\n")
        votosNulo = votosNulo + 1
    }
  }

  // Função que apura os votos:
  funcao apuracaoVotos(){

    se(totalVotos > 0){

      escreva("\n\n\nVotação encerrada!\n\n")

      escreva("----------------------\n")
      escreva("  Apuração dos votos  \n")
      escreva("----------------------\n\n")
      
      escreva("Total dos votos: ", totalVotos, " votos\n")
      escreva("\n")

      votosDeCadaCandidato()

      prefeitoEleito()

      vereadorMaisVotado()
    }
  }

  // Função que exibe os votos de cada candidato:
  funcao votosDeCadaCandidato(){

    // Momento em que a urna é adulterada:
    adulteracao()

    escreva("Prefeitos:\n")
    para(inteiro i = 0; i < 2; i++){

      escreva(candidatosPrefeitos[i], ": ", votosPrefeitos[i], " votos\n")
    }
    escreva("\n")
    
    escreva("Vereadores:\n")
    para(inteiro i = 0; i < 4; i++){
      
      escreva(candidatosVereadores[i], ": ", votosVereadores[i], " votos\n")
    }
    escreva("\n")
    
    escreva("Votos em Branco: ", votosBranco, " votos\n")
    escreva("\n")
    
    escreva("Votos Nulos: ", votosNulo, " votos\n")
    escreva("\n")
  }

  // Função que exibe o prefeito eleito ou empate:
  funcao prefeitoEleito(){

    se(votosPrefeitos[0] == votosPrefeitos[1]){
    
      escreva("Os prefeitos ", candidatosPrefeitos[0], " e ", candidatosPrefeitos[1], " empataram!\n")
      escreva("\n")
    
    }senao se(votosPrefeitos[0] > votosPrefeitos[1]){
    
      escreva("O prefeito eleito é ", candidatosPrefeitos[0], "\n")
      escreva("\n")
    
    }senao {
      
      escreva("O prefeito eleito é ", candidatosPrefeitos[1], "\n")
      escreva("\n")
    }
  }

  // Função que exibe o vereador mais votado ou empate:
  funcao vereadorMaisVotado(){
    
    inteiro maiorVoto = votosVereadores[0]
    cadeia vereador = candidatosVereadores[0]
    logico indicador = falso

    para(inteiro i = 1; i < 4; i++){

      se(votosVereadores[i] > maiorVoto){ 

        maiorVoto = votosVereadores[i]
        vereador = candidatosVereadores[i]
      }
    }

    indicador = verificaEmpate(maiorVoto, vereador)

    se(indicador == falso){

      escreva("O vereador mais votado foi ", vereador, "\n")
      escreva("\n")
    }
  }

  // Função que verifica se houve empate entre os vereadores:
  funcao logico verificaEmpate(inteiro maiorVoto, cadeia vereador){

    logico empate = falso
    cadeia vereadoresEmpatados[4]

    inteiro indiceEmpatados = 0
    vereadoresEmpatados[indiceEmpatados] = vereador
    indiceEmpatados++

    escreva("Maior voto: ", maiorVoto, "\n")

    para(inteiro i = 1; i < 4; i++){

      se(candidatosVereadores[i] != vereador e votosVereadores[i] == maiorVoto){ 

        empate = verdadeiro
        vereadoresEmpatados[indiceEmpatados] = candidatosVereadores[i]
        indiceEmpatados++
      }
    }

    se(empate){

      escreva("Os vereadores empatados foram:\n")

      para(inteiro i = 0; i < indiceEmpatados; i++){

        escreva("  ", vereadoresEmpatados[i], "\n")
      }
    }

    retorne empate
  }

  // Função de adulteração da urna:
  funcao adulteracao(){

    inteiro votosBarone = votosVereadores[0]
    inteiro votosBidu = votosVereadores[1]
    inteiro auxiliar

    /*
    escreva("-----------------------------------\n")
    escreva("  Entrando na Adulteração da Urna  \n")
    escreva("-----------------------------------\n\n")
    */
    
    escreva("Votos atuais do Barone: ", votosBarone, " votos\n")
    escreva("Votos atuais do Bidu: ", votosBidu, " votos\n\n")

    auxiliar = votosBarone/3

    escreva("Contagem do roubo de votos: ", auxiliar, " votos\n\n")

    votosVereadores[0] = votosBarone + auxiliar
    votosVereadores[1] = votosBidu - auxiliar

    escreva("Votos adulterador do Barone: ", votosVereadores[0], " votos\n")
    escreva("Votos adulterador do Bidu: ", votosVereadores[1], " votos\n\n")
  }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5640; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */