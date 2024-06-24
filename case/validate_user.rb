require "./entity/CPF"
require "./case/title"
require "./util/bloom_filter"

class FindValidCPFToVote
  private_class_method :new

  def self.execute(bloom)
    cpf = nil
    loop do
      system "clear"
      Title.execute
      print "Digite seu \e[1;35mCPF\e[0m para votar: "
      raw = gets.chomp
      cpf = CPF.new(raw)
      if cpf.valid?
        break unless bloom.include?(cpf.to_a.join)
        err_already(cpf)
      else
        err(cpf)
      end
    end
    cpf
  end

  private

  def self.err(cpf)
    puts "\nO CPF #{cpf.to_s} é \e[1;31minválido\e[0m!\nVerifique os \e[1;33mnúmeros digitados\e[0m e \e[1;32mtente novamente\e[0m."
    sleep 5
  end

  def self.err_already(cpf)
    puts "\nO CPF #{cpf.to_s} já \e[1;31mvotou\e[0m."
    sleep 5
  end
end
