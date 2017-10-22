
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Required: mac
# git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
# git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
if [ -d "$HOME/.rbenv/bin" ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Required:
# git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
# git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
# rbenv install 2.2.4
# rbenv rehash
# rbenv global 2.2.4
# rbenv exec gem install bundler
# rbenv rehash
# rbenv exec gem which bundler
# if [ -d "/usr/local/rbenv/bin" ] ; then
#   export RBENV_ROOT="/usr/local/rbenv"
#   export PATH="/usr/local/rbenv/bin:$PATH"
#   eval "$(rbenv init -)"
# fi
if builtin command -v rbenv > /dev/null; then
  eval "$(rbenv init -)"
if

if [ -d "/usr/local/lib/node_modules/npm/bin" ] ; then
  export PATH=/usr/local/lib/node_modules/npm/bin:$PATH
fi
if [ -d "$HOME/.nodebrew/current/bin" ] ; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

if [ -d "/Users/toka/database/data" ] ; then
  export PGDATA=/Users/toka/database/data
fi

if [ -d "~/go" ] ; then
 	export GOPATH=~/go
fi
