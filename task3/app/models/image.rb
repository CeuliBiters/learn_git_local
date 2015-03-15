class Image < ActiveRecord::Base
  dragonfly_accessor :file
  attr_accessible :file, :title
  validates :title, presence: true, length: {minimum: 2, maximum: 20}
  validates :file, presence: true
 
  validates :file, presence: true
  validates_size_of :file, maximum: 200.kilobytes, message: "should be no more than 200 KB", if: :file_changed?
 
  validates_property :format, of: :file, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false, message: "should be either .jpeg, .jpg, .png, .bmp", if: :file_changed?
  dragonfly_accessor :file do
    after_assign { |img| img.encode!('jpg', '-quality 80') }
  end
end
