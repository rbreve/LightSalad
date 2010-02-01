require 'erb'
require 'config/accelerator/accelerator_tasks'
 
set :application, "salad" #matches names used in smf_template.erb
set :repository,  "svn+ssh://salad@8.7.217.112/home/salad/salad-repos/salad/trunk"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/salad/deployed/#{application}" # I like this location
 
set :user, 'salad'
 
# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :subversion
 
# Set the path to svn and rake if needed
set :svn, "/opt/csw/bin/svn"
set :rake, "/opt/csw/bin/rake"
 
 
set :domain, '8.7.217.112'
 
role :app, domain
role :web, domain
role :db,  domain, :primary => true
 
set :server_name, "lightsalad.com"
set :server_alias, "*.lightsalad.com"
 
# Example dependancies
depend :remote, :command, :gem
depend :remote, :gem, :money, '>=1.7.1'
depend :remote, :gem, :mongrel, '>=1.0.1'
depend :remote, :gem, :image_science, '>=1.1.3'
depend :remote, :gem, :rake, '>=0.7'
depend :remote, :gem, :BlueCloth, '>=1.0.0'
depend :remote, :gem, :RubyInline, '>=3.6.3'
 
deploy.task :restart do
  accelerator.smf_restart
  accelerator.restart_apache
end
 
deploy.task :start do
  accelerator.smf_start
  accelerator.restart_apache
end
 
deploy.task :stop do
  accelerator.smf_stop
  accelerator.restart_apache
end
 
after :deploy, 'deploy:cleanup'
