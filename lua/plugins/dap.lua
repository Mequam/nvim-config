return {
   "mfussenegger/nvim-dap",
   branch = "master",
   config = function()
      local dap = require("dap")
      local ctable = {
         type="executable";
         command = "gdb";
         args = {'-i=dap'};
      }
      dap.adapters.cpp = ctable
      dap.adapters.c = ctable


    dap.configurations.cpp = {
      {
        type = 'cpp';
        request = 'launch';
        name = "Launch file";
        program = "prob1";
     }
  }
 dap.configurations.c = {
   {
     type = 'c';
     request = 'launch';
     name = "Launch file";
     program = "prob1";
  }
}

   end
}
