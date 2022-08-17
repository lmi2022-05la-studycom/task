class Task < ApplicationRecord
    before_create :set_started_at
    validates :content, presence: true
    belongs_to :user
    belongs_to :tag

    def set_started_at
        self.started_at = Time.zone.today + 9.hours
    end
end
