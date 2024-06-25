# service/voting_storage_service.rb

class VotingStorageService
  attr_reader :votes

  def initialize(bloom_filter)
    @bloom_filter = bloom_filter
    @votes = {}
  end

  def record_vote(cpf, candidate_number)
    @votes[candidate_number] ||= 0
    @votes[candidate_number] += 1
    @bloom_filter.push(cpf.to_a.join)
  end
end
