require("neotest").setup({
	adapters = {
		require("neotest-rspec")({
			rspec_cmd = function()
				return vim.tbl_flatten({
					"docker",
					"compose",
					"exec",
					"-it",
					"backend",
					"bundle",
					"exec",
					"rspec",
				})
			end,

			transform_spec_path = function(path)
				local prefix = require("neotest-rspec").root(path)
				return string.sub(path, string.len(prefix) + 2, -1)
			end,

			results_path = "tmp/rspec.output",
			summary = {
				follow = true,
				expand_errors = true,
			},
			output = {
				open_on_run = true,
			},
		}),
	},
})
