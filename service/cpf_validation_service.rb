# service/cpf_validation_service.rb

class CPFValidationService
  def initialize(bloom_filter)
    @bloom_filter = bloom_filter
  end

  def validate(cpf_raw)
    cpf = CPF.new(cpf_raw)
    if cpf.valid?
      return :already_voted if @bloom_filter.include?(cpf.to_a.join)
      :valid
    else
      :invalid
    end
  end
end
