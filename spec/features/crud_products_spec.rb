require 'rails_helper'

describe "User can CRUD products" do
    it "can create a product" do
        visit '/products'
        expect(page).to have_link 'Create'
        click_on 'Create'
        expect(page).to have_content 'Create Product'
        fill_in "Title",	with: "Jquerybook"
        click_on 'Create Product'
        expect(page).to have_content 'There is an error when create'
    end

    # it "can update a product" do
    #     visit '/products'
    #     expect(page).to have_link 'Edit'

    # end

    it "can read products" do
        visit '/products'
        expect(page).to have_content(products)  
    end
    
    
end
