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
    
    Obs:2) Sugere-se uma implementação extra onde a cada três votos que o candidato a vereador (Barone) 
    receber deve-se retirar um voto do candidato Barone e passá-lo para o candidato a vereador (Bidu). 
  */

  // Declaração de variáveis globais:
  inteiro usuarioLogado = -1
  inteiro totalVotos = 0
  logico sair = falso, logado = falso, apuracao = falso
  cadeia opcao = "0", senhaAcesso = "2411", senhaDigitada
  cadeia votosPrefeitos[2][2] = {{"90 - Herbert", 0}, {"95 - Ribeiro", 0}}
  cadeia votosVereadores[4][2] = {{"90000 - Barone", 0}, {"90999 - Bidu", 0}, {"95000 - Monteiro", 0}, {"95999 - João Fera", 0}}
  inteiro votosNulo = 0, votosBranco = 0

  funcao inicio() {
    
    boasVindas()

    enquanto(logado == falso e sair == falso){
 
      obterDadosDoUsuario()
 
      logado = autenticar(senhaDigitada)

      logadoNoSistema()
    }
    
  }

  funcao boasVindas(){

    escreva("----------------------------------\n")
    escreva("------ SISTEMA DE VOTAÇÃO --------\n")
    escreva("----------------------------------\n")
    escreva("\nOlá, seja bem vindo ao sistema!\n")
  }

  funcao obterDadosDoUsuario(){

    escreva("\nDigite a senha de acesso: ")
    leia(senhaDigitada)
  }

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

  funcao logadoNoSistema(){

    enquanto(logado){

      menuInicial()

      escolha(opcao){      

        caso "1": iniciarVotacao() pare
        
        caso "0": encerrarVotacao() pare
        
        caso contrario:
          escreva("Opção invalida")
          escreva("\n----------------------------------\n")
      }
    }
  }

  funcao menuInicial(){

    escreva("\n")
    escreva(" Escolha uma das opção abaixo:\n")
    escreva(" 1 - Iniciar votação\n")
    escreva(" 0 - Encerrar votação\n")
    escreva(" Opção: ")
    leia(opcao)
    escreva("\n")
  }
  
  funcao encerrarVotacao(){

    apuracao()

    escreva("\nSaindo do sistema...\n")

    logado = falso
    sair = verdadeiro
    
  }

  funcao iniciarVotacao(){

    menuPrefeitos()

    escolhaPrefeito()

    menuVereadores()

    escolhaVereador()
  }

  funcao escolhaPrefeito(){
    
    totalVotos++
    escolha(opcao){

      caso "90": 
        escreva("Votou em Herbert\n") 
        votosPrefeitos[0][1] = votosPrefeitos[0][1] + 1
        pare

      caso "95": 
        escreva("Votou em Ribeiro\n") 
        votosPrefeitos[1][1] = votosPrefeitos[1][1] + 1
        pare
      
      caso "1": 
        escreva("Votou em Branco\n") 
        votosBranco = votosBranco + 1
        pare

      caso contrario:
        escreva("Votou Nulo\n")
        votosNulo = votosNulo + 1
    }
  }

  funcao escolhaVereador(){
    
    totalVotos++
    escolha(opcao){

      caso "90000": 
        escreva("Votou em Barone\n") 
        votosVereadores[0][1] = votosVereadores[0][1] + 1
        pare

      caso "90999": 
        escreva("Votou em Bidu\n") 
        votosVereadores[1][1] = votosVereadores[1][1] + 1
        pare

      caso "95000": 
        escreva("Votou em Monteiro\n") 
        votosVereadores[2][1] = votosVereadores[2][1] + 1
        pare

      caso "95999": 
        escreva("Votou em João Fera\n") 
        votosVereadores[3][1] = votosVereadores[3][1] + 1
        pare
      
      caso "1": 
        escreva("Votou em Branco\n") 
        votosBranco = votosBranco + 1
        pare

      caso contrario:
        escreva("Votou Nulo\n")
        votosNulo = votosNulo + 1
    }
  }
  
  funcao menuPrefeitos(){

    escreva("\n")
    escreva(" Escolha o seu candidato a Prefeito:\n")
    escreva(" 90 - Herbert\n")
    escreva(" 95 - Ribeiro\n")
    escreva(" 1 - Branco\n")
    escreva(" Opção: ")
    leia(opcao)
    escreva("\n")
  }

  funcao menuVereadores(){

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
  }

  funcao apuracao(){

    se(totalVotos > 0){

      escreva("\nVotação encerrada!\n\n")

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

  funcao votosDeCadaCandidato(){

    // Momento em que a urna é adulterada:
    adulteracao()

    escreva("Prefeitos:\n")
    para(inteiro i = 0; i < 2; i++){

      escreva(votosPrefeitos[i][0], ": ", votosPrefeitos[i][1], " votos\n")
    }
    escreva("\n")
    
    escreva("Vereadores:\n")
    para(inteiro i = 0; i < 4; i++){
      
      escreva(votosVereadores[i][0], ": ", votosVereadores[i][1], " votos\n")
    }
    escreva("\n")
    
    escreva("Votos em Branco: ", votosBranco, " votos\n")
    escreva("\n")
    
    escreva("Votos Nulos: ", votosNulo, " votos\n")
    escreva("\n")
  }

  funcao prefeitoEleito(){

    se(votosPrefeitos[0][1] == votosPrefeitos[1][1]){
    
      escreva("Os prefeitos ", votosPrefeitos[0][0], " e ", votosPrefeitos[1][0], " empataram!\n")
      escreva("\n")
    
    }senao se(votosPrefeitos[0][1] > votosPrefeitos[1][1]){
    
      escreva("O prefeito eleito é ", votosPrefeitos[0][0], "\n")
      escreva("\n")
    
    }senao {
      
      escreva("O prefeito eleito é ", votosPrefeitos[1][0], "\n")
      escreva("\n")
    }
  }

  funcao vereadorMaisVotado(){
    
    inteiro maiorVoto = votosVereadores[0][1]
    cadeia vereador = votosVereadores[0][0]
    logico indicador = falso

    para(inteiro i = 1; i < 3; i++){

      se(votosVereadores[i][1] > maiorVoto){ 

        maiorVoto = votosVereadores[i][1]
        vereador = votosVereadores[i][0]
      }
    }

    indicador = verificaEmpate(maiorVoto, vereador)

    se(indicador == falso){

      escreva("O vereador mais votado foi ", vereador, "\n")
      escreva("\n")
    }
  }

  funcao logico verificaEmpate(inteiro maiorVoto, cadeia vereador){

    logico empate = falso
    cadeia vereadoresEmpatados[4]

    vereadoresEmpatados[0] = vereador

    para(inteiro i = 1; i < 3; i++){

      se(votosVereadores[i][1] == maiorVoto){ 

        empate = verdadeiro
        vereadoresEmpatados[i] = votosVereadores[i][0]
      }
    }

    se(empate){

      escreva("Os vereadores empatados foram:\n")

      para(inteiro i = 0; i < 4; i++){

        escreva("  ", vereadoresEmpatados[i], "\n")
      }
    }

    retorne empate
  }

  // Função de adulteração da urna

  funcao adulteracao(){

    inteiro votosBarone = votosVereadores[0][1]
    inteiro votosBidu = votosVereadores[1][1]
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

    votosVereadores[0][1] = votosBarone + auxiliar
    votosVereadores[1][1] = votosBidu - auxiliar

    escreva("Votos adulterador do Barone: ", votosVereadores[0][1], " votos\n")
    escreva("Votos adulterador do Bidu: ", votosVereadores[1][1], " votos\n\n")
  }
}
