-- Packer插件管理
require('plugins')
require('mapping/keying')
require('plugin-config/nvim-treesitter')
require('plugin-config/nvim-tree')

--table-mode--
vim.g['table_mode_corner']='|'
vim.g['table_mode_border']=0
vim.g['table_mode_fillchar']='='


--airline--
vim.g['airline_theme']='quantum'
vim.g['airline_powerline_fonts']='0'
--airline--

--MarkDown--
vim.g['mkdp_browser']='firefox'

--Ranger--
vim.g['ranger_map_keys']=0

--autoformat--
vim.g['autoformat_verbosemode']=1



--Netrw--
vim.g['netrw_liststyle']=3
vim.g['netrw_banner']=0
vim.g['netrw_winsize']=100

vim.g['apc_enable_ft']={text=1, markdown=1}

vim.g['rbpt_max']=16
vim.g['rbpt_loadcmd_toggle']=0
--MD.VIM
vim.g['vim_markdown_folding_disabled']= 1
vim.g['vim_markdown_override_foldtext']= 0
vim.g['vim_markdown_folding_level']= 6
vim.g['vim_markdown_no_default_key_mappings']= 1
vim.g['vim_markdown_emphasis_multiline']= 0
vim.g['vim_markdown_frontmatte']=1

vim.g['mdip_imgname']="image"
vim.g['UltiSnipsExpandTrigger']='<tab>'
vim.g['UltiSnipsJumpForwardTrigger']='<tab>'
vim.g['UltiSnipsJumpBackwardTrigger']='<S-tab>'
vim.g['UltiSnipsSnippetDirectories']={"path/of/snippetDirectories"}
vim.g['UltiSnipsEditSplit']="vertical"
