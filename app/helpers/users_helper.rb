module UsersHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      "https://placeholdit.imgix.net/~text?txtsize=50&txt=#{user.name}&w=240&h=240"
    end
  end
end
