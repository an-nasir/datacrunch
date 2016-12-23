require "rails_helper"

RSpec.describe CrunchesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => root_path).to route_to("crunches#index")
    end

  end
end
