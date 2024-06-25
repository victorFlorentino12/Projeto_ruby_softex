#view/voting_storage_view.rb

require "./service/voting_storage_service"

class VotingStorageView
  def initialize(voting_storage, banner: Banner.new)
    @voting_storage = voting_storage
    @banner = banner
  end

  def start
    system "clear"
    @banner.display
    puts "Voto Registrado com \e[1;32msucesso\e[0m!"
    sleep 3
  end
end
