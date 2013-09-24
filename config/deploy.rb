require "bundler/capistrano"
server "88.198.107.86", :web, :app, :db, primary: true

set :application, "visitka"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :whenever_command, "bundle exec whenever"
  require "whenever/capistrano"
set :scm, "git"
set :repository,  "git@github.com:art13/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml.sample"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    #run "ln -s #{shared_path}/public/spree #{release_path}/public/spree"
  end
  
  after "deploy:finalize_update", "deploy:symlink_config"
  #namespace :solr do                                                              
  #task :reindex do
  #  run "cd #{current_path} && #{rake} RAILS_ENV=#{rails_env} sunspot:solr:reindex" 
  #end
  # task :stop do
  #  run "cd #{current_path} && #{rake} RAILS_ENV=#{rails_env} sunspot:solr:stop" 
  #end
#end 
end