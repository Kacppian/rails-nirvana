module ApplicationHelper
	def full_title(page_title = '')
		postfix_title = "Ruby on Rails Tutorial Sample App"
		title = if page_title.present?
			"#{page_title} | #{postfix_title}"
		else
			postfix_title
		end
	end
end
