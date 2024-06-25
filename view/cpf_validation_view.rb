# ui/cpf_validation_view.rb
require "./view/component/banner"
require "./entity/CPF"

class CPFValidationView
  def initialize(validation_service, banner: Banner.new)
    @validation_service = validation_service
    @banner = banner
    @actions = {
      invalid: method(:show_invalid_cpf_error),
      already_voted: method(:show_already_voted_error),
    }
  end

  def start
    loop do
      system "clear"
      @banner.display
      print "Digite seu \e[1;35mCPF\e[0m para votar: "
      raw_cpf = gets.chomp

      validation_result = @validation_service.validate(raw_cpf)
      return CPF.new(raw_cpf) if validation_result == :valid
      @actions[validation_result].call(raw_cpf)
    end
  end

  private

  def show_invalid_cpf_error(cpf)
    puts "\nO CPF #{cpf} é \e[1;31minválido\e[0m!\nVerifique os \e[1;33mnúmeros digitados\e[0m e \e[1;32mtente novamente\e[0m."
    sleep 5
  end

  def show_already_voted_error(cpf)
    puts "\nO CPF #{cpf} já \e[1;31mvotou\e[0m."
    sleep 5
  end
end
