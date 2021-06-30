require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

  scenario "user can see product detail" do
    # ACT
    visit root_path

    # VERIFY
    # first(:link, '.btn-default').click
    # click_link '.btn-default', match: :first
    find('.btn-default', match: :first).click
    

    expect(page).to have_text ('Description')
    
    # DEBUG
    save_screenshot "product-detail.png"

  end

end
