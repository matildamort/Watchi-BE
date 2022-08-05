require 'rails_helper'

# RSpec.describe Show, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Show, type: :model do
  it { should have_many(:reviews) }
  it { should have_one_attached(:picture) }
end


RSpec.describe Show, type: :model do
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:description).of_type(:string) }

end

RSpec.describe Show, type: :model do
  it {should have_many(:reviews)}
end


    