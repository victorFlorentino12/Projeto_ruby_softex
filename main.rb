# main.rb

# Imports das Views
require "./view/voting_view"
require "./view/voting_storage_view"
require "./view/cpf_validation_view"
require "./view/exit_view"
require "./view/result_view"

# Imports dos Services
require "./service/bloom_filter_service"
require "./service/cpf_validation_service"
require "./service/voting_storage_service"

class VotingApplication
  def initialize
    @bloom_filter_service = BloomFilterService.new
    @voting_storage_service = VotingStorageService.new(@bloom_filter_service)
    @cpf_validation_service = CPFValidationService.new(@bloom_filter_service)
    @cpf_validation_view = CPFValidationView.new(@cpf_validation_service)
    @voting_storage_view = VotingStorageView.new(@voting_storage_service)
    @voting_view = VotingView.new
    @exit_view = ExitView.new
    @Result_view = ResultView.new
  end

  def run
    # loop do
    #   cpf = @cpf_validation_view.start
    #   candidate = @voting_view.start
    #   @voting_storage_service.record_vote(cpf, candidate)
    #   @voting_storage_view.start
    #   break unless @exit_view.start
    # end
    @Result_view.start
  end
end

# Executa o aplicativo de votação
$voting_app = VotingApplication.new
$voting_app.run
