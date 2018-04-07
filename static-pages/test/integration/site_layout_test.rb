require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
	test "Layout links" do 
		get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", helf_path
    assert_select "a[href=?]", contact_path
	end

	test "Test Signup path" do 
		get signup_path
		assert_select "title", "Sign up | Ruby on Rails Tutorial Sample App"
	end

end