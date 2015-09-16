# == Schema Information
#
# Table name: dog_rental_requests
#
#  id         :integer          not null, primary key
#  dog_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DogRentalRequest < ActiveRecord::Base
  validates :dog_id, :start_date, :end_date, :status, presence: true
  validate :overlapping_approved_requests

  belongs_to :dog

  def overlapping_requests
    DogRentalRequest.where(dog_id: dog_id).where("start_date BETWEEN :start_date AND :end_date OR
    end_date BETWEEN :start_date AND :end_date", {start_date: start_date, end_date: end_date})
  end

  def overlapping_approved_requests
    unless overlapping_requests.select { |request| request.status == 'APPROVED'}.empty?
      errors.add(:overlapping_request, "overlaps with an existing approved request")
    end
  end

end
