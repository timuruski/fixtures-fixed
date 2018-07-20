Fixtures.define "items" do
  items = DB[:items]

  # populate the table
  items.insert(name: 'abc', price: 10.00)
  items.insert(name: 'def', price: 20.00)
  items.insert(name: 'ghi', price: 30.00)
end
