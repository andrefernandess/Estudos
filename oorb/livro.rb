class Livro
	attr_reader :titulo, :preco, :ano_lancamento,:possui_reimpressao

	def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
		@titulo = titulo
		@ano_lancamento = ano_lancamento
		@preco = calcula_preco(preco)
		@possui_reimpressao = possui_reimpressao
	end

	def to_csv
		"#{titulo}, #{ano_lancamento}, #{preco}"
	end
	
	private
	def calcula_preco(base)
		if @ano_lancamento < 2006
			if @possui_reimpressao
				base*0.9
			else
				base*0.95
			end
		elsif @ano_lancamento <=2010
			base*0.96
		else
			base
		end			
	end

	def possui_reimpressao?
		@possui_reimpressao
	end
end

class Estoque

	def initialize
		@livros = []
	end

	def adiciona(livro)
		@livros << livro if livro
	end

	def exporta_csv
		@livros.each do |livro|
		puts livro.to_csv
		end
	end


	def total
		@livros.size
	end

	def mais_barato_que(valor)
		@livros.select do |livro|
			puts livro.titulo if livro.preco < valor
		end
	end
end


def livro_para_newslatter(livro)
	if livro.ano_lancamento < 2000
		puts "Newslatter"
		puts livro.titulo
		puts livro.preco
		puts "\n\n\n"
	end
end


arquitetura = Livro.new("Introducao a arquitetura e Design de Software", 70.00, 2011, true)

algoritmos = Livro.new("algoritmos", 60, 1999, true)

livro_para_newslatter(algoritmos)
livro_para_newslatter(arquitetura)

estoque = Estoque.new
estoque.adiciona(algoritmos)
estoque.adiciona(arquitetura) 

estoque.exporta_csv
puts estoque.total
puts estoque.mais_barato_que 70			

