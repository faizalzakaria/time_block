require 'time_block'

class TimeBlock::CLI
  def self.start(*args)
    fail 'No terminal-notifier, please install it, brew install terminal-notifier' unless terminal_notifier_exist?
    time = args.shift.strip.to_i
    sleep time
    `terminal-notifier -message #{"Time is out dude !!!".dump} -title "TimeBlock - #{time}s" -sound "default"`
  rescue => e
    puts e.message
    exit(1)
  end

  def self.terminal_notifier_exist?
    `which terminal-notifier`
    $? == 0
  end
end
