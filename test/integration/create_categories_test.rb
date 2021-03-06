require "test_helper"

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	test "get new category form and create a category" do
		get new_category_path
		assert_template "categories/new"

		assert_difference "Category.count", 1 do 
			post categories_path, params: { category: {name: "testing"} }
			follow_redirect!
		end

		assert_template "categories/index"
		assert_match "testing", response.body
	end

end