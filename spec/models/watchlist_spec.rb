require 'rails_helper'

# RSpec.describe Watchlist, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


Rspec.describe Watchlist, type: :model do
  it { should have_many(:shows) }
  it { should belong_to(:user) }
end
