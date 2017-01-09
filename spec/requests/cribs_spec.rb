require 'rails_helper'

RSpec.describe "Cribs", type: :request do
  describe "GET /cribs" do
    it "works! (now write some real specs)" do
      get cribs_path
      expect(response).to have_http_status(200)
    end
  end
end
