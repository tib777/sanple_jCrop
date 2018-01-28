class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
    after_update :crop_avatar
    
    def crop_avatar
        binding.pry
        image.recreate_versions! if crop_x.present?
    end
end
