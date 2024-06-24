require "./case/title"
require "./case/vote"
require "./case/validate_user"
require "./util/bloom_filter"
require "./util/confirmation_dialog"

$bloom = Bloom.new
$dialog_end = ConfirmationDialog.new("Deseja votar novamente? [\e[32;1m(S)im\e[0m, \e[31;1m(N)ão\e[0m]")
loop do
  $cpf = FindValidCPFToVote.execute($bloom)
  $vote = FindVote.execute
  $bloom.push($cpf.to_a.join)
  puts "Voto Registrado com sucesso!"
  sleep 3
  break unless $dialog_end.execute
end
