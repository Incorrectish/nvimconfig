local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
-- configs.setup {
  -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  -- ignore_install = { "" }, -- List of parsers to ignore installing
  -- autopairs = {
    -- enable = true,
  -- },
  -- highlight = {
    -- enable = true, -- false will disable the whole extension
    -- disable = { "" }, -- list of language that will be disabled
    -- additional_vim_regex_highlighting = true,
  -- },
  -- indent = { enable = true, disable = { "yaml" } },
  -- context_commentstring = {
    -- enable = true,
    -- enable_autocmd = false,
  -- },
-- }
