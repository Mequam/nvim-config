local o = vim.opt

--split config
o.splitbelow = true
o.splitright = true

--backup stuff
o.undofile = true -- Persistent undo's across all sessions
o.backup = false -- Don't write backups. (For better performance and, unneeded non-sense
o.writebackup = false -- Don't write backups.

--tab stuff
o.shiftwidth = 3 -- Insert two shifts per indent.
o.tabstop = 3
o.expandtab = true -- Convert tabs to spaces.
o.smartindent = true -- Non-strict cindent.
o.autoindent = true -- Copy indent from the current line when starting a new line
o.breakindent = true -- Indent wrapped lines too.
o.copyindent = true -- Copy the structure of the existing lines' indents.

--relative numbering
o.number = true -- Enable line numbers
o.relativenumber = true --relative numbers!

--folding
o.foldmethod = "syntax"
o.foldlevel = 100

--white space display
--o.listchars = "nbsp:_,tab:\|.,trail:~,extends:>,precedes:<"
o.list = true

--corsor stuff
o.cursorline = true

--leader mapping
vim.g.mapleader = " "
