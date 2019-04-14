class Chamado < ApplicationRecord
    validates :nome, presence: true
    validates :nome, length: { minimum: 3 }
end
