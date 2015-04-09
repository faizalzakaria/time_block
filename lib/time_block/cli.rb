require 'time_block'

class TimeBlock::CLI
  def self.start(*args)
    time = args.shift.strip.to_i
    sleep time
    `terminal-notifier -message #{"Time is out dude !!!".dump} -title "TimeBlock - #{time}s" -sound "default"`
  rescue => e
    puts e.message
    exit(1)
  end
end
