class User < ApplicationRecord
  belongs_to :institution
  belongs_to :course

  enum kind: [:student, :monitor, :admin]
end
