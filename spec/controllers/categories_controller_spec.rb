require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let!(:category) { Category.create(name: "Fiction")}

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end
end