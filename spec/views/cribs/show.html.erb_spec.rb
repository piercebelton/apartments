require 'rails_helper'

RSpec.describe "cribs/show", type: :view do
  before(:each) do
    @crib = assign(:crib, Crib.create!(
      :street => "Street",
      :city => "City",
      :zip => 2,
      :state => "State",
      :country => "Country",
      :name => "Name",
      :phone => 3,
      :contact_hours => "Contact Hours"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Contact Hours/)
  end
end
