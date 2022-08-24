# This is custom application initializer
# @author sercan tırnavalı
# @date 24.08.2022
#
PROJECT_PATH="$HOME/Documents/projects/Archivist"
SOLR_PATH = "$HOME/Documents/projects/solr-9.0.0"
script_1 = <<HEREDOC
gnome-terminal -- bash -c "cd #{PROJECT_PATH}; rails s; exec $SHELL "
HEREDOC
script_2 = <<HEREDOC
gnome-terminal -- bash -c "cd #{SOLR_PATH}; ./bin/solr start; exec $SHELL"
HEREDOC

# Run rails project
system script_1
# Run solr
system script_2
# Open vs code
system "cd #{PROJECT_PATH}; code ."
