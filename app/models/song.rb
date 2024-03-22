class Song < ApplicationRecord
  belongs_to :artist

  before_validation :format_title, on: :create
  before_save :validacion_description

  private

  def validacion_description
    self.description = description.split('').shuffle if description.include?('</script>')
  end

  def format_title
    self.title = title.capitalize
  end
end
