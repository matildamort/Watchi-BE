require 'rails_helper'

# RSpec.describe Show, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Show, type: :model do
  it { should have_many(:reviews) }
  it { should have_one_attached(:picture) }
end
end


RSpec.describe Show, type: :model do
  it { should allow_destroy_by(:admin) }
end





    