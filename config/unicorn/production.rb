#
$worker = 2


$timeout = 30

# Application name
$app_dir = "/var/www/achieve/current"

# port number
$listen = File.expand_path 'tmp/sockets/unicorn.sock', $app_dir

#pid directory
$pid = File.expand_path 'tmp/pids/unicorn.pid', $app_dir

# error log directory
$std_log = File.expand_path 'log/unicorn.log', $app_dir

# for applying above settings
worker_processes $worker
working_directory $app_dir
stderr_path $std_log
stdout_path $std_log
timeout $timeout
listen $listen
pid $pid

# hot deploy
preload_app true

# settings before fork
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      Process.kill "QUIT", File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

# After fork
after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
