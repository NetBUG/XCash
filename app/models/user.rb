class User < ActiveRecord::Base
  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  serialize :roles, Array
  enumerize :roles, in: [:root, :bartender, :cook, :cashier, :steward], multiple: true, predicates: true
end
