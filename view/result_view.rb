#view/result_view.rb

require "./view/component/banner"

class ResultView
  def initialize(voting_storage_service, size = 30, banner: Banner.new)
    @voting_storage = voting_storage_service
    @size = size
    @banner = banner
  end

  def start
    total = @voting_storage.votes.reduce(0) { |acc, (key, value)| acc + value }

    total = 1 if total == 0

    max_vote = @voting_storage.votes.values.max

    most_voted = @voting_storage.votes.select { |key, value| value == max_vote }.keys

    @banner.display

    puts "".rjust(17) + "▲".ljust(@size) + "◔"
    VotingService::CANDIDATES.each do |key, candidate|
      puts "#{candidate.name.rjust(16)} ┤\e[38;2;#{candidate.color.to_a.join(";")}m#{"".ljust(bar_size(key, total), "▇")}\e[0m"
      puts "#{"".rjust(16)} │" if key == "1"
    end
    # ┤"
    puts "".rjust(17) + "└".ljust(@size, "─") + "►"
  end

  private

  def bar_size(key, total)
    votes = @voting_storage.votes[key].nil? ? 0 : @voting_storage.votes[key]
    (votes * (@size - 2) / total).to_i + 1
  end
end
