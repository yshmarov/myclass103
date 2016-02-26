class Guest::BaseController < ApplicationController
  before_action :authenticate_guest!
  layout 'guest'
end 
