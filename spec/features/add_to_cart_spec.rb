require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

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

  scenario "User should add item to cart" do
    # ACT
    visit root_path
    
    expect(page).to have_text('My Cart (0)')
    save_screenshot "add_item_0.png"
  
    # VERIFY
    click_button('Add', match: :first)
  
    expect(page).to have_text('My Cart (1)')
  
    # DEBUG
    save_screenshot "add_item_1.png"
  
  end
end
