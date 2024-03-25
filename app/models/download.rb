class Download < ApplicationRecord
  belongs_to :song

  before_create :set_date

  private

  def set_date
    self.created_date = rand(Time.at(2.months.ago)..Time.at(Time.now))
  end
end
