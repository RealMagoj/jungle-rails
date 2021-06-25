require 'rails_helper'

RSpec.feature "Vistior navigates to product detail page by clicking on product", type: :feature, js: true do
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

  scenario "They see the product detail page of the product they clicked on" do
    visit root_path
    first('article.product').click_link('Details')
    sleep(1)
    # save_screenshot
    expect(page).to have_css 'article.product-detail'
  end
end
