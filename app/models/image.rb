class Image < ActiveRecord::Base
  belongs_to :post
  has_attached_file :file, 
    :styles => {:small => "600x600>"}, 
    :storage => :s3, 
    :s3_credentials => "#{Rails.root}/config/s3.yml", 
    :path => "images/:id/:style/:filename",
    :url => ":s3_eu_url"
  validates_attachment_presence :file
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png']
end
