module ApplicationHelper
  def user_avatar(user, size = 30)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      user.avatar.attach_avatar = 'defualt-avatar.png'
    end
  end
end
