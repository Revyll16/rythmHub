module ApplicationHelper
  def youtube_embed_url(video_url)
    if video_url =~ /youtu\.be\/([^\?]*)/
      "https://www.youtube.com/embed/#{$1}"
    elsif video_url =~ /youtube\.com.*v=([^&]*)/
      "https://www.youtube.com/embed/#{$1}"
    else
      video_url
    end
  end
end
