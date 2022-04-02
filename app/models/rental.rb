class Rental < ApplicationRecord
    belongs_to :user
    belongs_to :car
    
    # validates :price, presence: true
    validates :user_id, presence: true
    validates :car_id, presence: true
    validates :start_date, presence: true
    validates :start_date, inclusion: { in: (Date.today..Date.today+1.years) }
    validates :end_date, presence: true
    validate :end_date_after_start_date
    
    def end_date_after_start_date
        return if end_date.blank? || start_date.blank?
    
        if end_date < start_date
        errors.add(:end_date, "must be after the start date")
        end
    end
    
end
