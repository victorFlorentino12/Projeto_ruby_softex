class ConfirmationDialog
  def initialize(prompt, invalid_message = "\nOpção \e[31;1mInválida\e[0m.\n")
    @prompt = prompt
    @invalid_message = invalid_message
  end

  def execute
    loop do
      print @prompt
      case gets.chomp.downcase[0]
      when "s"
        return true
      when "n"
        return false
      else
        print @invalid_message
      end
    end
  end
end
