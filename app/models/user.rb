class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  
  def mood
    unless nausea.nil? || happiness.nil?
      if nausea > happiness
        "sad"
      elsif happiness > nausea
        "happy"
      end
    end
  end

  def admin?
    admin
  end
end
