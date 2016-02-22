require 'rails_helper'

RSpec.describe "excludes/show", type: :view do
  before(:each) do
    @exclude = assign(:exclude, Exclude.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
