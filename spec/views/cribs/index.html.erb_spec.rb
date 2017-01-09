require 'rails_helper'

RSpec.describe "cribs/index", type: :view do
  before(:each) do
    assign(:cribs, [
      Crib.create!(
        :street => "Street",
        :city => "City",
        :zip => 2,
        :state => "State",
        :country => "Country",
        :name => "Name",
        :phone => 3,
        :contact_hours => "Contact Hours"
      ),
      Crib.create!(
        :street => "Street",
        :city => "City",
        :zip => 2,
        :state => "State",
        :country => "Country",
        :name => "Name",
        :phone => 3,
        :contact_hours => "Contact Hours"
      )
    ])
  end

  it "renders a list of cribs" do
    render
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Contact Hours".to_s, :count => 2
  end
end
