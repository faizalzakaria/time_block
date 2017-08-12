require 'dante'
require 'time_block'
require 'time_block/agent'
require 'getoptlong'

class TimeBlock::CLI
  class << self

    class UnsupportedCommand < StandardError; end

    def run
      parse_args
      set_defaults
      execute
    end

    private

    def execute
      send(@command)
    end

    def restart
      stop
      start
    end

    def start
      Dante::Runner
        .new('timeblock')
        .execute(daemonize: true, pid_path: pid_path, log_path: log_path) do |_opts|
        TimeBlock::Agent.new(@time).run
      end
    end

    def stop
      Dante::Runner
        .new('timeblock')
        .execute(kill: true, pid_path: pid_path)
    end

    def pid_path
      '/tmp/timeblock.pid'
    end

    def log_path
      '/tmp/timeblock.log'
    end

    def set_defaults
      @time ||= 60
      @verbose ||= false
    end

    def parse_args
      opts = GetoptLong.new(['--help', '-h', GetoptLong::NO_ARGUMENT],
                            ['--time', '-t', GetoptLong::REQUIRED_ARGUMENT],
                            ['--verbose', '-v', GetoptLong::NO_ARGUMENT])
      @time = nil
      @verboes  = nil
      opts.each do |opt, arg|
        case opt
        when '--help'
          print_help
          exit(0)
        when '--time'
          @time = arg.to_i
        when '--verbose'
          @verbose = true
        end
      end

      @command = ARGV.shift
      return if supported_commands?(@command)
      raise UnsupportedCommand, "Unsupported command detected, #@command"
    end

    def supported_commands?(cmd)
      cmd.nil? || %w[stop start restart].include?(cmd)
    end

    def print_help
      puts <<~EOF
        heartbeat [OPTION]
          --help, -h:
            show help
          --time [time], -i [time]:
            interval, e.g: 60 (in seconds)

      EOF
    end
  end
end
