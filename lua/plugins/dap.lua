local dap = require("dap")
-- dap configurations
local dap_breakpoint = {
	breakpoint = {
		text = "🔴",
		texthl = "LspDiagnosticsSignError",
		linehl = "",
		numhl = "",
	},
	rejected = {
		text = "🔴",
		texthl = "LspDiagnosticsSignHint",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = "➤",
		texthl = "LspDiagnosticsSignInformation",
		linehl = "DiagnosticUnderlineInfo",
		numhl = "LspDiagnosticsSignInformation",
	},
}

-- dap exetensions configurations
require("nvim-dap-virtual-text").setup({
	commented = true,
})

local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.breakpoint)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

-- C/C++/Rust
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "-i", "dap" },
}

dap.configurations.cpp = {
	{
		name = "C++ Debug And Run",
		type = "gdb",
		request = "launch",
		program = function()
			local fileName = vim.fn.expand("%:t:r")
			-- create this directory
			os.execute("mkdir -p " .. "bin")
			local cmd = "!g++ -g % -o bin/" .. fileName
			-- First, compile it
			vim.cmd(cmd)
			-- Then, return it
			return "${fileDirname}/bin/" .. fileName
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		runInTerminal = true,
	},
}

-- Dart / Flutter
dap.adapters.dart = {
	type = "executable",
	command = "dart",
	args = { "debug_adapter" },
}
dap.adapters.flutter = {
	type = "executable",
	command = "flutter",
	args = { "debug_adapter" },
}
dap.configurations.dart = {
	{
		type = "dart",
		request = "launch",
		name = "Launch dart",
		dartSdkPath = "/opt/flutter/bin/dart", -- ensure this is correct
		flutterSdkPath = "/opt/flutter/bin/flutter", -- ensure this is correct
		program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
		cwd = "${workspaceFolder}",
	},
	{
		type = "flutter",
		request = "launch",
		name = "Launch flutter",
		dartSdkPath = "/opt/flutter/bin/dart", -- ensure this is correct
		flutterSdkPath = "/opt/flutter/bin/flutter", -- ensure this is correct
		program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
		cwd = "${workspaceFolder}",
	},
}
