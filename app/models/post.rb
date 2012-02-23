class Post < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
    has_many :images, :dependent => :destroy
    attr_accessor :abstract, :text
    after_initialize :init

    def init
      if content
        arr = content.split '---', 2
        if arr.length >= 2
          @abstract, @text = arr
        else
          @text = arr[0]
        end
      end
    end
end
