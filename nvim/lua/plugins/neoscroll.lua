return { 
    "karb94/neoscroll.nvim",
	config = function()
		require('neoscroll').setup({
			easing_function = "quadratic",
			animation_time = 300,
		})
	end
}