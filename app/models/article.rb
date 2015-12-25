class Article < ActiveRecord::Base
  # la tabla
  # los campos
  # metodos
  validates :title,  presence: true, uniqueness: true
  validates :body, presence: true, length: {minimum: 20}
end
