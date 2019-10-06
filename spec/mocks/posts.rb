Post = Struct.new :id, :created_by, :name

mock :post do |user, opts|
  user.id          = sequence :user_id
  user.name        = opts[:name]  || Faker::Name.name
  user.created_by  = opts[:created_by] || sequence(:post_creator)

  def user.can user=nil
    user ||= User.current
    policy(user: user, model: self).can
  end
end