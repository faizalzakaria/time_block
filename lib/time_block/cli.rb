require 'time_block'

class TimeBlock::CLI
  def self.start(*args)
    puts args.inspect
  rescue => e
    puts e.message
    exit(1)
  end
end
