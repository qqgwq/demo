class User < ActiveRecord::Base
  has_secure_password
  enum gender: ["female", "male"]
  has_many :orders

  rails_admin do
    navigation_label '<i class="fa fa-user" aria-hidden="true">用户</i>'.html_safe
    field :name
    field :gender
  end
end
