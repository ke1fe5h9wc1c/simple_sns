class Tweet < ApplicationRecord
  validates :comment, presence: true ,length: { maximum: 140 }
end
