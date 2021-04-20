class Idea < ApplicationRecord

has_many :reviews, dependent: :destroy

validates(:title, presence: true, uniqueness: true)

validates(:description, presence: {message:  "must include a question"},
length:{ minimum: 10},
)


before_save do
# self is the record instance
# inmediately before saving to the database capitalize the title

    self.title = title.capitalize
end
end
