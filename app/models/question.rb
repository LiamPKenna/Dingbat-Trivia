class Question < ApplicationRecord
  validates :question, presence: true
  validates :answer_1, presence: true
  validates :answer_2, presence: true
  validates :answer_3, presence: true
  validates :answer_4, presence: true
  validates :correct_answer, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 5 }

  scope :random, -> {(
    select("id")
    .order(Arel.sql('random()'))
    .limit(8)
  )}

end
