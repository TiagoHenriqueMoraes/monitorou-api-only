class Questionnaire < ApplicationRecord
  belongs_to :subject
  belongs_to :institution
end
