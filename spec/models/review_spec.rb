require 'rails_helper'

# RSpec.describe Review, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


Rspec.describe Review, type: :model do
  it { should belong_to(:show) }
end


Rspec.describe Review, type: :model do
  it { should have_one(:user) }
end


Rspec.describe Review, type: :model do
  it { should allow_destroy_by(:admin) }
end



