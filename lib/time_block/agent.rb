class TimeBlock::Agent
  def initialize(time)
    fail 'No terminal-notifier, please install it, brew install terminal-notifier' unless terminal_notifier_exist?
    @time = time
  end

  def run
    pre_callback
    sleep @time
    post_callback
  end

  private

  def terminal_notifier_exist?
    `which terminal-notifier`
    $? == 0
  end

  def pre_callback
    `terminal-notifier -message #{"Time is starting !!!".dump} -title "TimeBlock - #{@time}s" -sound "default"`
  end

  def post_callback
    `terminal-notifier -message #{"Time is out dude !!!".dump} -title "TimeBlock - #{@time}s" -sound "default"`
  end
end
