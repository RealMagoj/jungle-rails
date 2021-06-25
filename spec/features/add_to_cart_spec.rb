require 'rails_helper'

RSpec.feature "Vistior clicks add to cart on product", type: :feature, js: true do
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

  scenario "They see the my cart count change to 1" do
    visit root_path
    first('article.product').find('button[type="submit"]').click
    sleep(1)
    # puts page.html
    # save_screenshot
    expect(page).to have_content 'My Cart (1)'
  end
end
