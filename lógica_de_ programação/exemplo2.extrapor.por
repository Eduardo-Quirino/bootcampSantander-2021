programa
{
	
	funcao inicio()
	{
		real jan, fev, mar,abr,total,media
		cadeia nome
		
		escreva("Qual seu nome?")
		leia (nome)
		escreva("Venda de Janeiro")
		leia(jan)
		escreva("Venda de Fevereiro")
		leia(fev)
		escreva("Venda de Março")
		leia(mar)
		escreva("Venda de Abril")
		leia (abr)

		total = jan+fev+mar+abr
		media = (jan+fev+mar+abr)/4
		escreva("Vendedor: "+nome+" seu total de vendas foi:"+total+" e teve média de vendas: "+media)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 412; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */