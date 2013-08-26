module ApplicationHelper

	def is_active(path)
		"active" if current_page?(path)
	end
end
