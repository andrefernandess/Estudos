class Livro
	attr_reader :titulo, :preco, :ano_lancamento

	def initialize(titulo, preco, ano_lancamento)
		@titulo = titulo
		@ano_lancamento = ano_lancamento
		@preco = calcula_preco(preco)
	end

	def calcula_preco(preco)
		if @ano_lancamento < 2000
			preco = preco*0.7
		else
			preco
		end
	end
	

end

def livro_para_newslatter(livro)
	if livro.ano_lancamento < 2000
		puts "Newslatter"
		puts livro.titulo
		puts livro.preco
	end
end


agile = Livro.new("Agile Web Development with Rails", 70, 2011)

algoritmos = Livro.new("algoritmos", 60, 1999)

livro_para_newslatter(algoritmos)
#imprime_nota_fiscal(agile)


