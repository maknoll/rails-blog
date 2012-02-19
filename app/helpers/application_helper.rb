module ApplicationHelper
	def syntax(text)
		text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
			CodeRay.scan($3, $2).div(:css => :class, :tab_width=> 4)
		end
	end
end
