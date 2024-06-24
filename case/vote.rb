require "./entity/candidate"
require "./entity/color"
require "./util/confirmation_dialog"

class FindVote
  private_class_method :new

  @@candidates = {
    "0" => Candidate.new("Nulo", Color.new(255, 0, 0), ""),
    "1" => Candidate.new("Branco", Color.new(255, 255, 255), ""),
    "15" => Candidate.new("Jim Halpert", Color.new(178, 218, 250), "☺"),
    "72" => Candidate.new("Sheldon Cooper", Color.new(15, 79, 52), "☢"),
    "60" => Candidate.new("Donald Draper", Color.new(0, 0, 0), "✎"),
    "99" => Candidate.new("Donna Paulsen", Color.new(139, 0, 0), "☎"),
    "68" => Candidate.new("Giorgio Rosa", Color.new(255, 0, 127), "☸"),
    "80" => Candidate.new("Enrico Frattasio", Color.new(159, 95, 0), "♬"),
  }

  def self.execute
    loop do
      system "clear"
      Title.execute
      @@candidates.map.with_index do |data, key|
        print_candidate(data[0], data[1])
        puts "" if key == 1
      end

      print "\nPor favor, escolha uma \e[1;34mopção\e[0m: "

      option_selected = gets.chomp

      unless @@candidates.key?(option_selected)
        option_selected = "0"
        puts "A opção escolhida não corresponde a nenhum candidato;\n será atribuído o voto \e[31;1mnulo\e[0m.\n"
      end

      candidate = @@candidates[option_selected]

      dialog = ConfirmationDialog.new(
        "\nConfirma o voto#{" em" if option_selected != "0"} \e[36;1m#{candidate.name}\e[0m? [\e[32;1m(S)im\e[0m, \e[31;1m(N)ão\e[0m]"
      )

      return option_selected if dialog.execute
    end
  end

  private

  def self.print_candidate(number, candidate)
    puts "\e[1;34m#{"".ljust(11) + number.to_s.ljust(2)}\e[0m ➤ #{candidate.name_with_background(24)}"
  end
end
