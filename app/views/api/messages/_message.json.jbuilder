json.extract! message, :id, :title, :description, :tag
json.url api_message_url(message)
json.video_url url_for(message.video) if message.video.attached?