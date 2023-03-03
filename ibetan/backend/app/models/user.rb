# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :articles
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :events

  has_one :profile, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :likes
  
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
end
