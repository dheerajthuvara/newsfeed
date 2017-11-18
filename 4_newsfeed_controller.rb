class NewsfeedController < ApplicationController
  # JSON endpoint that returns an array of Post objects in order of
  # newest first, to oldest last. Each Post contains a User object
  # (the author of the Post), and an array of Comments. Each Comment
  # will also include the User object of the Comment's author.

  # TODO: Newsfeed endpoint here

  def newsfeed
    get_posts(Time.now.utc)
  end

  def next_feed
    get_posts(params[:last_created_at])
  end

  def send_newsletter
    user = User.find params[:id]
    SubscriptionMailer.send_weekly_subscription(get_posts(Time.now.utc), user).deliver_now
    redirect_to funtion_path
  end

  private

  def get_posts(time)
    @posts = Post.where("created_at < ?", time).includes(:user, :comments, :commented_users)
                      .order(created_at: :desc)
                      .limit(50)
  end
end
