# service/voting_service.rb

require "./entity/candidate"
require "./entity/color"

class VotingService
  CANDIDATES = {
    "0" => Candidate.new("Nulo", Color.new(255, 0, 0), ""),
    "1" => Candidate.new("Branco", Color.new(255, 255, 255), ""),
    "15" => Candidate.new("Jim Halpert", Color.new(178, 218, 250), "☺"),
    "72" => Candidate.new("Sheldon Cooper", Color.new(15, 79, 52), "☢"),
    "60" => Candidate.new("Donald Draper", Color.new(0, 0, 0), "✎"),
    "99" => Candidate.new("Donna Paulsen", Color.new(139, 0, 0), "☎"),
    "68" => Candidate.new("Giorgio Rosa", Color.new(255, 0, 127), "☸"),
    "80" => Candidate.new("Enrico Frattasio", Color.new(159, 95, 0), "♬"),
  }

  def select_candidate(option)
    option_selected = validate_candidate_option(option)
    CANDIDATES[option_selected]
  end

  private

  def validate_candidate_option(option)
    return option if CANDIDATES.key?(option)
    "0"
  end
end
