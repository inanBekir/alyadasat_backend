class Product < ApplicationRecord
    searchkick word_start: [:title, :description]
    belongs_to :user

    def search_data
        {
          title: title,
          description: description
        }
      end
end
