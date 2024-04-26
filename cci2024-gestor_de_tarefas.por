programa
{
	/************************************************************
	Projecto: Gestor de Tarefas
	Descrição: Trabalho prático de Computação Científica I, 
			 ISPTEC, Engenharia Química.
	Autor: joao.costa@isptec.co.ao
	************************************************************/
	funcao inicio()
	{
		inteiro op
		cadeia nome_da_lista = ""
		logico submenu = falso
		// menu principal
		faca 
		{
			limpa()
			escreva("Minhas listas\n\n")
			escreva("1. O meu dia\n")
			escreva("2. Importante\n")
			escreva("3. Planeado\n")
			escreva("4. Tarefas\n")
			escreva("5. Terminar o programa\n")
	
			escreva("\n\nInforme uma opção: ")
			leia(op)
	
			escolha(op){
				caso 1:
					//escreva("\n\nEscolheu a opção 1 - O meu dia\n")
					nome_da_lista = "\"O meu dia\""
					submenu = verdadeiro
					pare
				caso 2:
					//escreva("\n\nEscolheu a opção 2 - Importante\n")
					nome_da_lista = "\"Importante\""
					submenu = verdadeiro
					pare
				caso 3:
					//escreva("\n\nEscolheu a opção 3 - Planeado\n")
					nome_da_lista = "\"Planeado\""
					submenu = verdadeiro
					pare
				caso 4:
					//escreva("\n\nEscolheu a opção 4 - Tarefas\n")
					nome_da_lista = "\"Tarefas\""
					submenu = verdadeiro
					pare
				caso 5:
					escreva("\n\nDeseja terminar o programa? (1-sim, 2-não):")
					leia(op)
					se(op == 1)
					{
						escreva("\n\nO programa foi encerrado.\n")
						op = 5	
					}
					pare
				caso contrario:
					escreva("\n\nOpção inválida !!!!\n")
			}

			// submenu
			se(submenu)
			{
				limpa()
				escreva("Lista ",nome_da_lista,"\n\n")
				escreva("1. Adicionar uma tarefa\n")
				escreva("2. Tarefas\n")
				escreva("3. Tarefas concluídas\n")
				escreva("4. Voltar\n")
		
				escreva("\n\nInforme uma opção: ")
				leia(op)
			}
			
		} enquanto (op != 5)
	}
}





/* joao.costa@isptec.co.ao */
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1560; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */