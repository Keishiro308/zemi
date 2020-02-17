class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  def save_with_image(params)
    if params[:images].present?
      ActiveRecord::Base.transaction do
        self.save!
        params[:images]['name'].each do |image|
          self.images.create!(
            name: image
          )
        end
      end
    else
      self.save
    end
  end

  def update_with_image(event_params, params)
    if params[:images].present?
      ActiveRecord::Base.transaction do
        self.update!(event_params)
        params[:images]['name'].each do |image|
          self.images.create!(
            name: image
          )
        end
      end
    else
      self.update(event_params)
    end
  end
  
end