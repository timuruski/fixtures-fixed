require "spec_helper"

RSpec.describe "Items" do
  require_fixture "items"

  it "works" do
    items = DB[:items]

    expect(items.count).to eq 3
    expect(items.avg(:price)).to be_within(0.1).of(20.00)
  end
end
