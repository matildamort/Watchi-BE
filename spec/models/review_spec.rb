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


# RSpec.describe Review, type: :model do
#   it { should have_one(:user) }
# end


# RSpec.describe Review, type: :model do
#   it { should allow_destroy_by(:admin) }
# end

RSpec.describe Review, type: :model do
it { should have_db_column(:rating).of_type(:integer) }
it { should have_db_column(:message).of_type(:string) }
it { should have_db_column(:show_id).of_type(:integer) }
it { should have_db_column(:user_id).of_type(:integer) }
end

RSpec.describe Review, type: :model do
it { should have_db_index(:show_id) }
it { should have_db_index(:user_id) }
end

RSpec.describe Review, type: :model do
  it {should validate_presence_of(:rating)}
end

RSpec.describe Review, type: :model do
  it {should belong_to(:show)}
end

RSpec.describe Review, type: :model do
  it {should belong_to(:user)}
end







