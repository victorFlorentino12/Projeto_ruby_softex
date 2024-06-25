#view/component/confirmation_dialog

class ConfirmationDialog
  def initialize(prompt_message: "", invalid_option_message: "\nOpção \e[31;1mInválida\e[0m.\n")
    @prompt_message = prompt_message
    @invalid_option_message = invalid_option_message
  end

  def execute
    loop do
      print @prompt_message
      case gets.chomp.downcase[0]
      when "s"
        return true
      when "n"
        return false
      else
        print @invalid_option_message
      end
    end
  end

  def set_prompt_message(prompt_message)
    @prompt_message = prompt_message
  end
end
