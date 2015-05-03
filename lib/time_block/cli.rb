require 'dante'
require 'time_block'
require 'time_block/agent'

class TimeBlock::CLI
  def self.start(*args)
    time = args.shift.strip.to_i
    Dante::Runner.new('timeblock').execute(daemonize: true, pid_path: '/tmp/timeblock.pid', log_path: '/tmp/timblock.log') do |opts|
      TimeBlock::Agent.new(time).run
    end
  rescue => e
    puts e.message
    exit(1)
  end
end
