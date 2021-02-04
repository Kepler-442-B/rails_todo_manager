class User < ApplicationRecord
  def to_presentable_string
    "(#{id}) #{name} - #{email}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
