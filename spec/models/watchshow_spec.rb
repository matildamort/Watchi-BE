require 'rails_helper'

# RSpec.describe Watchshow, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

  RSpec.describe Watchshow, type: :model do
    it { should have_db_index(:show_id) }
    it { should have_db_index(:watchlist_id) }
    end
    