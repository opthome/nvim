
local dap = require("dap")

-- python
dap.adapters.python = {
  type = 'executable',
  command = '/usr/local/bin/python3',
  args = { '-m', 'debugpy.adapter' },
}
dap.configurations.python = {
  {
    type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch',
    name = "Launch file",
    program = "${file}", -- This configuration will launch the current file if used.
    pythonPath = function()
        return "/usr/bin/python3"
      end
  },
}





