# Load DSL and set up stages
require "capistrano/setup"

require "capistrano/deploy"

require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/puma'
require 'capistrano/postgresql'
require 'capistrano/ssh_doctor'
require 'capistrano/sidekiq'
require 'capistrano/sidekiq/monit'

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

install_plugin Capistrano::Puma  # Default puma tasks
install_plugin Capistrano::Puma::Workers  # if you want to control the workers (in cluster mode)
install_plugin Capistrano::Puma::Nginx  # if you want to upload a nginx site template

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
