require 'rails_helper'

RSpec.feature "Visitor click on a single product", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "Detailed page" do
    visit root_path

    find('.product').hover
    find('.pull-right').click

    
    expect(page).to have_css 'section.products-show'
    save_screenshot
  end

end
