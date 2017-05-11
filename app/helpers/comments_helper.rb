module CommentsHelper
  def comment_function
    Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'comment_created', {
      message: 'あなたの作成したブログにコメントが付きました'
    })
  end

  def comment_notification
    Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'notification_created', {
      unread_counts: Notification.where(user_id: @comment.blog.user_id, read: false).count
    })
  end
end
