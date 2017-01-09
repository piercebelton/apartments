require 'rails_helper'

RSpec.describe "cribs/new", type: :view do
  before(:each) do
    assign(:crib, Crib.new(
      :street => "MyString",
      :city => "MyString",
      :zip => 1,
      :state => "MyString",
      :country => "MyString",
      :name => "MyString",
      :phone => 1,
      :contact_hours => "MyString"
    ))
  end

  it "renders new crib form" do
    render

    assert_select "form[action=?][method=?]", cribs_path, "post" do

      assert_select "input#crib_street[name=?]", "crib[street]"

      assert_select "input#crib_city[name=?]", "crib[city]"

      assert_select "input#crib_zip[name=?]", "crib[zip]"

      assert_select "input#crib_state[name=?]", "crib[state]"

      assert_select "input#crib_country[name=?]", "crib[country]"

      assert_select "input#crib_name[name=?]", "crib[name]"

      assert_select "input#crib_phone[name=?]", "crib[phone]"

      assert_select "input#crib_contact_hours[name=?]", "crib[contact_hours]"
    end
  end
end
