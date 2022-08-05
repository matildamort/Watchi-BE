require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


RSpec.describe User, type: :model do
  
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) }
end



RSpec.describe User, type: :model do
  it { should validate_length_of(:password).is_at_least(6) }
end

