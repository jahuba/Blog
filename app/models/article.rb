class Article < ActiveRecord::Base
  # la tabla
  # los campos
  # metodos
  belongs_to :user
  validates :title,  presence: true, uniqueness: true
  validates :body, presence: true, length: {minimum: 20}
end
