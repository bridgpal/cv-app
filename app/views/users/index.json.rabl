collection @users, root: :users

attributes :id, :email

node :href do |user|
  user_url(user)
end
