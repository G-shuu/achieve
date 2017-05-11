module NotificationsHelper
  def posted_time(time)
    time > Date.today ? "#{time_ago_in_words(time)}" : time.strftime('%m月%d日')
  end

  def more_than
    @notifications_count >= 1
  end
end
