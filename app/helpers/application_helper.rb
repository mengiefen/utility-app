module ApplicationHelper
  def user_avatar(user, _size = 30)
    if user.avatar.attached?
      user.avatar.url
    else
      'defualt-avatar.png'
    end
  end

  def utility_icon(utility, _size)
    if utility.icon.attached?
      utility.icon.url
    else
      utility.icon.attach_icon = 'default_icon.png'
    end
  end
end
