set :application, "vanessa_mayfield_profile"
set :repository,  "git@github.com:th3james/vanessa_mayfield_profile.git"

set :scm, :git
set :branch, :master
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "77.235.60.163"                          # Your HTTP server, Apache/etc
role :app, "77.235.60.163"                          # This may be the same as your `Web` server
role :db,  "77.235.60.163", :primary => true # This is where Rails migrations will run

set :user, "th3james"
set :use_sudo, true
set :runner, "th3james"
set :port, 30000

set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache


default_run_options[:pty] = true # Must be set for the password prompt from git to work

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
