class Post < ApplicationRecord
  belongs_to :forum
  belongs_to :musician
end
