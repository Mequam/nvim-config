return {
   "mfussenegger/nvim-dap",
   branch = "master",
   config = function()
      local dap = require("dap")
      
      dap.adapters.cpp = {
         type="executable";
         command = "gdb";
         args = {'-i=dap'};
      }

    dap.configurations.cpp = {
      {
        type = 'cpp';
        request = 'launch';
        name = "Launch file";
        program = "basic";
     },
  }
   end
}
