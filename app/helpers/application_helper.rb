module ApplicationHelper
  def user_avatar(user, size = 30)
    if user.avatar.attached?
      user.avatar.representation(resize_to_limit: [size, size])
    else
      'defualt-avatar.png'
    end
  end

  def utility_icon(utility, size)
    if utility.icon.attached?
      utility.icon.representation(resize_to_limit: [size, size])
    else
      utility.icon.attach_icon = 'defualt-icon.svg'
    end
  end
end
