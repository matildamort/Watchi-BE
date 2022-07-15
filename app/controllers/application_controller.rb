class ApplicationController < ActionController::API
    include Knock::Authenticable # makes all controllers user knock
end
