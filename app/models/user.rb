class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings

  validates :first_name, presence: true 
  validates :last_name, presence: true 
  validates :email, presence: true

  enum host: [:not_host, :host, :superhost]
  enum status: [:customer, :admin, :superadmin]
end
