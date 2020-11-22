ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :image_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :image_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    column :id 
    column :name
    column :email 
    column :created_at
    column :image_url 
    column :tweets do |user|
      user.tweets.all.count
    end
    column :retweets do |user|
      user.retweets.all.count
    end
    column :likes do |user|
      user.likes.all.count
    end
    column :friends do |user|
      user.friends.all.count
    end
    actions
  end
end
