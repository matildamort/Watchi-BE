require 'rails_helper'

# RSpec.describe Review, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


RSpec.describe Review, type: :model do
  it { should belong_to(:show) }
end

RSpec.describe Review, type: :model do
  it { should belong_to(:user) }
end


RSpec.describe Review, type: :model do
  it { should have_one(:user) }
end


RSpec.describe Review, type: :model do
  it { should allow_destroy_by(:admin) }
end





