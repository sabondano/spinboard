class Link < ActiveRecord::Base
  validates :url, presence: true
  validates :url, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }

  belongs_to :user
end
