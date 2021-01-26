class User < ApplicationRecord
  def to_presentable_string
    "(#{id}) #{name} - #{email}"
  end
end
