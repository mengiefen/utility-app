module ApplicationHelper
  def user_avatar(user, size = 30)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      user.avatar.attach_avatar = 'defualt-avatar.png'
    end
  end

  def utility_icon(utility, size)
    if utility.icon.attached?
      utility.icon.variant(resize: "#{size}x#{size}!")
    else
      utility.icon.attach_icon = 'defualt-icon.svg'
    end
  end
end
