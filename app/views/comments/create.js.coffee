$('#new_comment')[0]
	.reset()
$('#comments')
	.append '<%= escape_javascript(render @comment) %>'
$('#comments > p:last')
	.hide()
	.slideDown 'fast'
$('#comment_count')
    .html '<%= escape_javascript(pluralize @post.comments.size, 'Comment') %>'
