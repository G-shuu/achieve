module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
      image_tag(img_url, alt: user.name)
  end
end

module ActionView
  module Helpers
    module FormHelper
      def error_messages!(object_name, options = {})
        resource = self.instance_variable_get("@#{object_name}")
        return '' if !resource || resource.errors.empty?

        messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

        html = <<-HTML
         <div class = "alert alert-danger">
          <ul>#{messages}</ul>
         </div>
        HTML

        html.html_safe
      end

      def error_css(object_name, method, options = {})
        resource = self.instance_variable_get("@#{object_name}")
        return '' if resource.errors.empty?

        resource.errors.include?(method) ? 'has-error' : ''
      end
    end

    class  FormBuilder
      def error_messages!(options = {})
        @template.error_messages!(@object_name, options.merge(object: @object))
      end

      def error_css(method, options = {})
        @template.error_css(@object_name, method, options.merge(object: @object))
      end
    end
   end
  end

  def profile_img(user)
    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
      image_tag(img_url, alt: user.name)
  end

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
