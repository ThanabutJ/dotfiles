-- this is a fork of eviline
local gl = {}
gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local whitespace = require('galaxyline.provider_whitespace')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer','Outline','fugitive','GV'}

colors.bg = '#282828'
colors.fg = '#ebdbb2'
colors.yellow = '#d79921'
colors.lyellow = '#fabd2f'
colors.green = '#98971a'
colors.lgreen = '#b8bb26'
colors.orange = '#d65d0e'
colors.lorange = '#fe8019'
colors.purple = '#b16286'
colors.lpurple = '#d3869b'
colors.grey = '#928374'
colors.lgrey = '#a89984'
colors.darkblue = '#458588'
colors.blue = '#458588'
colors.lblue = '#83a598'
colors.red = '#cc241d'
colors.lred = '#fb4934'
colors.laqua = '#8ec07c'
colors.cyan = '#008080'
colors.magenta = '#d16d9e'

local padding = {
    provider = function() return ' ' end,
    condition = condition.buffer_not_empty,
}

local fileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    --        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
    highlight = {colors.orange,colors.bg},
}

local fileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
}

local bufType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.orange,colors.bg,'bold'}
}

gls.left = {
    {
        RainbowRed = padding
    },
    {
        ViMode = {
            provider = function()
                -- auto change color according the vim mode
                local mode_color = {
                    n = colors.orange,
                    i = colors.red,
                    v=colors.blue,
                    [''] = colors.blue,
                    V=colors.blue,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.orange,
                    S=colors.orange,
                    [''] = colors.orange,
                    ic = colors.yellow,
                    R = colors.violet,
                    Rv = colors.violet,
                    cv = colors.red,
                    ce=colors.red,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ['r?'] = colors.cyan,
                    ['!']  = colors.red,
                    t = colors.red
                }
                vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
                --          return '  '
--                local alias = {
--                    n = 'N ',i = 'I ',c= 'C ',
--                    v= 'V',V= 'VC ', [''] = 'VB '}
--                return alias[vim.fn.mode()]
                return '♥ '
            end,
            highlight = {colors.red,colors.bg,'bold'},
        },
    },
    {
        BufType = bufType
    },
    {
        FileIcon = fileIcon
    },
    {
        FileName = fileName
    },
    {
        DiagnosticError = {
            provider = 'DiagnosticError',
            icon = '  ',
            highlight = {colors.red,colors.bg}
        }
    },
    {
      DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.yellow,colors.bg},
      }
    },
    {
      DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.cyan,colors.bg},
      }
    },
    {
      DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue,colors.bg},
      }
    },
}

--gls.mid = {
--    {
--      paddLeft = padding,
--    },
--    {
--      paddRight = padding
--    },
--}

gls.right = {
    {
      DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        separator = ' ',
        icon = '  ',
        highlight = {colors.green,colors.bg},
      }
    },
    {
      DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {colors.orange,colors.bg},
      }
    },
    {
      DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.red,colors.bg},
      }
    },
    {
      GitIcon = {
        provider = function() return '  ' end,
        condition = condition.check_git_workspace,
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.blue,colors.bg,'bold'},
      }
    },
    {
      GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = {colors.blue,colors.bg,'bold'},
      }
    },
    {
      ShowLspClient = {
        provider = 'GetLspClient',
        separator = ' ',
        condition = function ()
          local tbl = {['dashboard'] = true,['']=true}
          if tbl[vim.bo.filetype] then
            return false
          end
          return true
        end and condition.buffer_not_empty,
        icon = ' LSP:',
        highlight = {colors.gray,colors.bg}
      }
    },
    {
      LineInfo = {
        provider = 'LineColumn',
        separator = ' ',
        condition = condition.hide_in_width,
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.fg,colors.bg},
      },
    },
    {
        ScrollBar = {
            provider = 'ScrollBar',
        }
    },
    {
      RainbowBlue = padding,
    },
}

gls.short_line_left = {
    {
        PadRight = padding,
    },
    {
        BufferType = bufType
    },
    {
        SFileName = {
            provider =  'SFileName',
            condition = condition.buffer_not_empty,
            highlight = {colors.fg,colors.bg,'bold'}
        }
    },
}


gls.short_line_right = {
    {
      BufferIcon = {
        provider= 'BufferIcon',
        highlight = {colors.fg,colors.bg}
      }
    },
    {
      LineInfo = {
        provider = 'LineColumn',
        separator = ' ',
        condition = condition.hide_in_width,
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.fg,colors.bg},
      },
    },
    {
        ScrollBar = {
            provider = 'ScrollBar',
        }
    },
}
