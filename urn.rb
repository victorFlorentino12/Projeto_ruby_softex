class Election
  def initialize(cpfValid, voteForVereador, voteForPrefeito, totalVereador, totalPrefeito)
    @cpfValid = cpfValid
    @voteForVereador = { x: 0, y: 0, k: 0, z: 0, nulo: 0, branco: 0 }
    @voteForPrefeito = { x: 0, y: 0, k: 0, z: 0, nulo: 0, branco: 0 }
    @totalVereador = totalVereador
    @totalPrefeito = totalPrefeito
  end

  def cpf_valid
    @cpfValid
  end

  def voteVereador   
    loop do 
      puts "Digite o número do vereador ou 5 para branco e 6 para nulo:"
      number_candidate = gets.chomp.to_i

      begin
        number_candidate_int = Integer(number_candidate)

        case number_candidate_int 
        when 1
            puts "Você está votando no candidato x? Digite sim ou não"
            if gets.chomp.upcase == "SIM"
                @voteForVereador[:x] += 1
                break
            else
                redo
            end
        when 2
            puts "Você está votando no candidato y? Digite sim ou não"
            if gets.chomp.upcase == "SIM"
                @voteForVereador[:y] += 1
                break
            else
                redo
            end
        when 3
            puts "Você está votando no candidato z? Digite sim ou não"
            if gets.chomp.upcase == "SIM"
                @voteForVereador[:z] += 1
                break
            else
                redo
            end
        when 4
            puts "Você está votando no candidato k? Digite sim ou não"
            if gets.chomp.upcase == "SIM"
                @voteForVereador[:k] += 1
                break
            else
                redo
            end
        when 5
            puts "Você está votando nulo? Digite sim ou não"
            if gets.chomp.upcase == "SIM"
                @voteForVereador[:nulo] += 1
                break
            else
                redo
            end
        when 6
            puts "Você está votando branco? Digite sim ou não"
            if gets.chomp.upcase == "SIM"
                @voteForVereador[:branco] += 1
                break
            else
                redo
            end
        else
            puts "Opção inválida. Tente novamente."
            redo
        end
        rescue ArgumentError => e
            puts "Erro ao processar entrada: #{e.message}"
            redo
        end
    end
  end

  def vote
    loop do
        case @cpfValid          
        when true
            voteVereador      
            puts('deseja encerrar a votção?')
            if (gets.chomp.to_s.upcase == "SIM")
                 puts "Temos os resultados das eleições"
                @voteForVereador.map {|key, value| [
                   puts("
                     Candidato #{key} com #{value}
                   ")                   
                ]}
                winner = @voteForVereador.max_by { |key, value| value }
                puts "O candidato eleito é #{winner[0]} com #{winner[1]} votos."
                break
            else
                redo
            end
        when false
            redo
        end
    end
  end
end

newElection = Election.new(true, {}, {}, 0, 0)
newElection.vote
