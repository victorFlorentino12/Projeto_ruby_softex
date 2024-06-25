# view/voting_view.rb

require "./view/component/banner"
require "./view/component/confirmation_dialog"
require "./service/voting_service"

class VotingView
  def initialize(dialog: ConfirmationDialog.new, banner: Banner.new, service: VotingService.new)
    @dialog = dialog
    @banner = banner
    @service = service
  end

  def start
    loop do
      display_candidate_list

      option_selected = gets.chomp

      candidate = @service.select_candidate(option_selected)

      return option_selected if confirm_vote(candidate)
    end
  end

  private

  def display_candidate_list
    system "clear"
    @banner.display
    VotingService::CANDIDATES.each_with_index do |(number, candidate), index|
      display_candidate(number, candidate)
      puts "" if index == 1
    end

    print "\nPor favor, escolha uma \e[1;34mopção\e[0m: "
  end

  def display_candidate(number, candidate)
    puts "\e[1;34m#{"".ljust(11) + number.to_s.ljust(2)}\e[0m ➤ #{candidate.name_with_background(24)}"
  end

  def confirm_vote(candidate)
    confirmation_message = "\nConfirma o voto#{" em" unless candidate.name == "Nulo"} \e[36;1m#{candidate.name}\e[0m? [\e[32;1m(S)im\e[0m, \e[31;1m(N)ão\e[0m]"
    @dialog.set_prompt_message(confirmation_message)

    @dialog.execute
  end
end
