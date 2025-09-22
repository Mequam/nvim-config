return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    --dependencies = { 'echasnovski/mini.icons' },
    config = function ()
        require('landing.landingPage')
    end
};
