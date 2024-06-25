# view/exit_view

require "./view/component/confirmation_dialog"

class ExitView
  def initialize(dialog: ConfirmationDialog.new, banner: Banner.new)
    @dialog = dialog
    @banner = banner
    @dialog.set_prompt_message("Deseja votar novamente? [\e[32;1m(S)im\e[0m, \e[31;1m(N)ão\e[0m]")
  end

  def start
    system "clear"
    @banner.display
    @dialog.execute
  end
end
