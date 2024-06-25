class ResultView
  def initialize(size = 30)
    @size = size
  end

  def start
    puts "".rjust(17) + "▲".ljust(@size) + "◔"
    VotingService::CANDIDATES.each do |key, candidate|
      puts "#{candidate.name.rjust(16)} ┤\e[38;2;#{candidate.color.to_a.join(";")}m▇▇▇▇▇▇▇▇\e[0m"
      puts "#{"".rjust(16)} │" if key == "1"
    end
    # ┤"
    puts "".rjust(17) + "└".ljust(@size, "─") + "►"
  end
end
