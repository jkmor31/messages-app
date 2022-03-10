class Message < ApplicationRecord
  belongs_to :speaker, optional: true
  has_one_attached :video
  has_one_attached :thumb
  scope :filter_by_tag, -> (tag) { where tag: tag }
  validates_presence_of :title, :tag, :description
end
