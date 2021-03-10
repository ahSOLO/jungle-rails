require 'rails_helper'

RSpec.feature "Visitor adds item to cart", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add a product to the cart" do
    # ACT
    visit root_path
    click_button("Add", match: :first)
    
    # DEBUG
    save_screenshot
    
    # VERIFY
    expect(page).to have_content 'My Cart (1)'
  end

end
