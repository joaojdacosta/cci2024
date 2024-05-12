programa
{
	/************************************************************
	Projecto: Gestor de Tarefas
	Descrição: Trabalho prático de Computação Científica I, 
			 ISPTEC, Engenharia Química.
	Autor: joao.costa@isptec.co.ao
	************************************************************/

	// inclusao de bibliotecas
	inclua biblioteca Texto --> tx
	inclua biblioteca Calendario --> cal

	// estruturas de dados globais
	const inteiro t = 100 // número máximo de tarefa a ser adicionada
	inteiro q = 0 // quantidade de tarefas adicionadas

	cadeia v_descricao[t] // descrição da tarefa
	logico v_meudia[t] // indica se a tarefa deve ou não ser realizada hoje
	logico v_importante[t] // indica se é ou não importante
	cadeia v_prazo[t] // prazo de realização da tarefa
	cadeia v_data[t] // data de criação da tarefa

	// variaveis auxiliares globais
	inteiro i, li
	cadeia buf
	
	funcao inicio()
	{
		inteiro op
		cadeia nome_da_lista = ""
		inteiro id_lista = -1
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
					id_lista = 1
					submenu = verdadeiro
					pare
				caso 2:
					//escreva("\n\nEscolheu a opção 2 - Importante\n")
					nome_da_lista = "\"Importante\""
					id_lista = 2
					submenu = verdadeiro
					pare
				caso 3:
					//escreva("\n\nEscolheu a opção 3 - Planeado\n")
					nome_da_lista = "\"Planeado\""
					id_lista = 3
					submenu = verdadeiro
					pare
				caso 4:
					//escreva("\n\nEscolheu a opção 4 - Tarefas\n")
					nome_da_lista = "\"Tarefas\""
					id_lista = 4
					submenu = verdadeiro
					pare
				caso 5:
					escreva("\n\nDeseja terminar o programa? (1-sim, 2-não):")
					leia(op)
					se(op == 1)
					{
						escreva("\n\nO programa foi encerrado.\n")
						op = 5	
						submenu = falso
					}
					pare
				caso contrario:
					escreva("\n\nOpção inválida !!!!\n")
			}

			// submenu
			se(submenu)
			{
				logico meudia
				se(tx.posicao_texto("O meu dia",nome_da_lista, 0) > 0) 
					meudia = verdadeiro
				senao 
					meudia = falso
					
				faca
				{
					limpa()
					escreva("Lista ",nome_da_lista,"\n\n")
					escreva("1. Adicionar uma tarefa\n")
					se(meudia)
						escreva("2. Listar afazeres do dia\n")
					senao
						escreva("2. Listar afazeres ",nome_da_lista,"\n")
					escreva("3. Marcar tarefa como concluída\n")
					escreva("4. Listar tarefas concluída\n")
					se(nao meudia)
						escreva("5. Adicionar tarefa a lista \"O meu dia\"\n")
					escreva("6. Voltar\n")
			
					escreva("\n\nInforme uma opção: ")
					leia(op)
	
					escolha(op)
					{
						caso 1: // Adicionar uma tarefa
							adicionar_tarefa(nome_da_lista)
							pare	
						caso 2://Listar afazeres
							listar_tarefas(id_lista)
							leia(buf) // aguarda comando para permitir vizualizar a impresseao
						caso 3: // Marcar tarefa como concluída
						caso 4: // Listar tarefas concluída
						caso 5: // Adicionar tarefa a lista "O meu dia"
						caso 6: // voltar
								pare
						caso contrario:
							escreva("\n\nOpção inválida !!!!\n")
					}
				} enquanto (op != 6)
			}
			
		} enquanto (op != 5)
	}

	/*****
	 * 
	*/
	funcao cadeia obter_data_do_sistema(){
		retorne cal.dia_mes_atual() 
				+ "/" + cal.mes_atual() 
				+ "/" + cal.ano_atual()
	}

	funcao logico adicionar_tarefa(cadeia nome_da_lista){
		se(q < t - 1)
		{
			escreva ("\n\nAdicionar uma nova tarefa\n")

			escreva("\nDescricação: ")
			leia(v_descricao[q])

			faca
			{
				escreva("\nÉ importante (1-Sim ou 2-Não): ")
				leia(li)
				escolha(li)
				{
					caso 1:
						v_importante[q] = verdadeiro
						pare
					caso 2:
						v_importante[q] = falso
						pare	
					caso contrario:
						li = 3
						escreva("Opção inválida!!! Por favor, seleccione uma opção correcta.\n")
				}
			} enquanto (li == 3)

			escreva("\nN.B.: Informe uma data no formato dd/mm/aaaa; \nou não insere a data, basta pressionar a tecla ENTER)")
			escreva("\nPrazo: ") 
			leia(v_prazo[q])

			// armazena a data da criação da tarefa
			v_data[q] = obter_data_do_sistema()

			// verifica se está no contexto da lista o meu dia
			se(tx.posicao_texto("O meu dia",nome_da_lista, 0) > 0) 
				v_meudia[q] = verdadeiro

			q++

			retorne verdadeiro
		}
		retorne falso
	}

	funcao vazio listar_tarefas(inteiro tipo) {
		
		escolha(tipo)
		{
			caso 1: // meu dia
			{
				para(i=0; i < q; i++)
					se(v_meudia[i]) 
					{
						escreva(i+1,". ", 
							v_descricao[i],
							", [",obter_estado_importancia(v_importante[i]),"]",
							", ", obter_prazo(v_prazo[i]),
							", criada em: ",v_data[i], "\n")
					}
				pare
			}
			caso 2: // importante
			{
				para(i=0; i < q; i++)
					se(v_importante[i]) 
					{
						escreva(i+1,". ", 
							v_descricao[i],
							", [",obter_estado_importancia(v_importante[i]),"]",
							", ",obter_prazo(v_prazo[i]),
							", criada em: ",v_data[i], "\n")
					}
				pare
			}
			caso 3: // planeado
			{
				para(i=0; i < q; i++)
					se(tx.numero_caracteres(v_prazo[i])>0) 
					{
						escreva(i+1,". ", 
							v_descricao[i],
							", [",obter_estado_importancia(v_importante[i]),"]",
							", ", obter_prazo(v_prazo[i]),
							", criada em: ",v_data[i], "\n")
					}
				pare
			}
			caso 4: // tarefas	
			{
				para(i=0; i < q; i++)
					escreva(i+1,". ", 
						v_descricao[i],
						", [",obter_estado_importancia(v_importante[i]),"]",
						", ", obter_prazo(v_prazo[i]),
						", criada em: ",v_data[i], "\n")
			}
		}
	}

	funcao cadeia obter_estado_importancia(logico estado)
	{
		se (estado) retorne "importante"
		retorne "não é importante"	
	}

	funcao cadeia obter_prazo(cadeia prazo)
	{
		se(tx.numero_caracteres(prazo) == 0) retorne ""
		retorne "Prazo: " + prazo	
	}
}





/* joao.costa@isptec.co.ao */
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2112; 
 * @DOBRAMENTO-CODIGO = [138, 144, 188, 243, 249];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */