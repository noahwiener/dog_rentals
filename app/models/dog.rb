# == Schema Information
#
# Table name: dogs
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  birth_date  :date             not null
#  color       :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Dog < ActiveRecord::Base
  validates :name, :birth_date, :sex, :color, :description, presence: true

  has_many :dog_rental_requests

  COLORS = %w(black white brown gray red)
  SEXES = %w(M F)

  def age
    age = (Time.now.year - self.birth_date.year)*7
    age > 0 ? age : "puppy"
  end
end
