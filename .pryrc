#group :development, :test do
#  gem 'pry-rails'  # rails console(もしくは、rails c)でirbの代わりにpryを使われる
#  gem 'pry-doc'    # methodを表示
#  gem 'pry-byebug' # デバッグを実施(Ruby 2.0以降で動作する)
#  gem 'pry-stack_explorer' # スタックをたどれる
#end


if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  /* Pry.commands.alias_command 'ss', 'show-stack'   # need pry-stack_explorer */
  Pry.editor = 'vim'
end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end
