class Photo < ApplicationRecord
	  has_attached_file :image

	    # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	   validates_attachment :image, presence: true,
  content_type: { content_type: "image/jpeg" },
  size: { in: 0..500.kilobytes }


end
