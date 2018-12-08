# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "demo"
set :repo_url, "git@github.com:qqgwq/demo.git"
set :deploy_to, "/home/gwq/demo"

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

set :rails_env, 'production'
set :user, 'gwq'
set :pty, true
set :use_sudo, false

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end