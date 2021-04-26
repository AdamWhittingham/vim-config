" Vim color file
"   This file was generated by Palette
"   http://rubygems.org/gems/palette
"
" Author: Adam Whittingham
" Notes:  A colourful scheme for bright programmers

hi clear
if version > 580
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name="adCode"

if has("gui_running")
    set background=dark
endif

hi Normal                     guifg=#FAFAFA ctermfg=231  guibg=#0A0A1A ctermbg=232  gui=NONE cterm=NONE
hi Visual                     guifg=NONE    ctermfg=NONE guibg=#3C414C ctermbg=238  gui=NONE cterm=NONE
hi LineNr                     guifg=#535969 ctermfg=240  guibg=#11112C ctermbg=233  gui=NONE cterm=NONE
hi Cursor                     guifg=#FAFAFA ctermfg=231  guibg=#646464 ctermbg=241  gui=NONE cterm=NONE
hi CursorLine                 guifg=NONE    ctermfg=NONE guibg=#242424 ctermbg=235  gui=NONE cterm=NONE
hi CursorLineNr               guifg=#FFFF40 ctermfg=227  guibg=#3C414C ctermbg=238  gui=NONE cterm=NONE
hi CursorColumn               guifg=NONE    ctermfg=NONE guibg=#303030 ctermbg=236  gui=NONE cterm=NONE
hi Search                     guifg=#0A0A1A ctermfg=232  guibg=#F8D454 ctermbg=221  gui=BOLD cterm=BOLD cterm=BOLD
hi MatchParen                 guifg=#F8D454 ctermfg=221  guibg=#0A0A1A ctermbg=232  gui=BOLD cterm=BOLD cterm=BOLD
hi SignColumn                 guifg=#FAFAFA ctermfg=231  guibg=#11112C ctermbg=233  gui=NONE cterm=NONE
hi VertSplit                  guifg=#11112C ctermfg=233  guibg=#11112C ctermbg=233  gui=NONE cterm=NONE
hi NonText                    guifg=#3C414C ctermfg=238  gui=BOLD cterm=BOLD cterm=BOLD
hi SpecialKey                 guifg=#3C414C ctermfg=238  guibg=#FF9800 ctermbg=208  gui=BOLD cterm=BOLD cterm=BOLD
hi RedundantSpaces            guifg=NONE    ctermfg=NONE guibg=#E9475A ctermbg=167  gui=NONE cterm=NONE
hi BadSpaces                  guifg=#3C414C ctermfg=238  guibg=#FF9800 ctermbg=208  gui=NONE cterm=NONE
hi StatusLine                 guifg=#FAFAFA ctermfg=231  guibg=#3C414C ctermbg=238  gui=NONE cterm=NONE
hi StatusLineNC               guifg=#11112C ctermfg=233  guibg=#3C414C ctermbg=238  gui=NONE cterm=NONE
hi PMenu                      guifg=#FAFAFA ctermfg=231  guibg=#3C414C ctermbg=238  gui=NONE cterm=NONE
hi PMenuSbar                  guifg=NONE    ctermfg=NONE guibg=#3C414C ctermbg=238  gui=NONE cterm=NONE
hi PMenuSel                   guifg=#FAFAFA ctermfg=231  guibg=#10B0FF ctermbg=39   gui=NONE cterm=NONE
hi PMenuThumb                 guifg=#0A0A1A ctermfg=232  guibg=#10B0FF ctermbg=39   gui=NONE cterm=NONE
hi StartifyBracket            guifg=#3C414C ctermfg=238  gui=NONE cterm=NONE
hi StartifyPath               guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi StartifySlash              guifg=#3C414C ctermfg=238  gui=NONE cterm=NONE
hi StartifyFile               guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi StartifyFooter             guifg=#3C414C ctermfg=238  gui=NONE cterm=NONE
hi StartifyHeader             guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi StartifyNumber             guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi StartifySpecial            guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi NERDTreeCWD                guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi NERDTreeDir                guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi NERDTreeDirSlash           guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi NERDTreeUp                 guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi NERDTreeOpenable           guifg=#00A787 ctermfg=36   gui=NONE cterm=NONE
hi NERDTreeClosable           guifg=#008787 ctermfg=30   gui=NONE cterm=NONE
hi netrwData                  guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi netrwSymLink               guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi bufExplorerCurFile         guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi bufExplorerAltBuf          guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi bufExplorerHelp            guifg=#3C414C ctermfg=238  gui=NONE cterm=NONE
hi bufExplorerSortBy          guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi GitGutterAdd               guifg=#33FF33 ctermfg=83   guibg=#115511 ctermbg=22   gui=NONE cterm=NONE
hi GitGutterAddLine           guifg=NONE    ctermfg=NONE guibg=#063806 ctermbg=22   gui=NONE cterm=NONE
hi GitGutterChange            guifg=#FFFF33 ctermfg=227  guibg=#757500 ctermbg=100  gui=NONE cterm=NONE
hi GitGutterChangeLine        guifg=NONE    ctermfg=NONE guibg=#383805 ctermbg=237  gui=NONE cterm=NONE
hi GitGutterDelete            guifg=#E9475A ctermfg=167  guibg=#331111 ctermbg=233  gui=NONE cterm=NONE
hi GitGutterDeleteLine        guifg=NONE    ctermfg=NONE guibg=#380505 ctermbg=52   gui=NONE cterm=NONE
hi GitGutterChangeDelete      guifg=#FFFF33 ctermfg=227  guibg=#757500 ctermbg=100  gui=NONE cterm=NONE
hi GitGutterChangeDeleteLine  guifg=NONE    ctermfg=NONE guibg=#383805 ctermbg=237  gui=NONE cterm=NONE
hi qfFileName                 guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi qfLineNr                   guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi Boolean                    guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi Character                  guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi Comment                    guifg=#757E92 ctermfg=244  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC cterm=NONE
hi Conditional                guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi Constant                   guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi Debug                      guifg=#FF9800 ctermfg=208  gui=NONE cterm=NONE
hi Define                     guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi Delimiter                  guifg=#FF9800 ctermfg=208  gui=NONE cterm=NONE
hi Exception                  guifg=#E9475A ctermfg=167  gui=NONE cterm=NONE
hi Float                      guifg=#00745E ctermfg=29   gui=NONE cterm=NONE
hi Function                   guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi Identifier                 guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi Include                    guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi Keyword                    guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi Label                      guifg=#7E8AA2 ctermfg=103  gui=NONE cterm=NONE
hi Number                     guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi Operator                   guifg=#7E8AA2 ctermfg=103  gui=NONE cterm=NONE
hi Special                    guifg=#84FF00 ctermfg=118  gui=NONE cterm=NONE
hi Statement                  guifg=#8C5FE6 ctermfg=98   gui=NONE cterm=NONE
hi String                     guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi Structure                  guifg=#7E8AA2 ctermfg=103  gui=NONE cterm=NONE
hi Title                      guifg=#F6F3E8 ctermfg=255  gui=NONE cterm=NONE
hi Todo                       guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi Type                       guifg=#54C0FF ctermfg=75   gui=NONE cterm=NONE
hi Typedef                    guifg=#7E8AA2 ctermfg=103  gui=NONE cterm=NONE
hi rubyAccess                 guifg=#7B68FF ctermfg=99   guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC cterm=NONE
hi rubyAttribute              guifg=#E080FF ctermfg=177  gui=NONE cterm=NONE
hi rubyBlockParameter         guifg=#00A787 ctermfg=36   gui=NONE cterm=NONE
hi rubyBlockParameterList     guifg=#008787 ctermfg=30   gui=NONE cterm=NONE
hi rubyBoolean                guifg=#FFFF40 ctermfg=227  guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi rubyClass                  guifg=#9C4AC0 ctermfg=133  gui=ITALIC cterm=ITALIC cterm=NONE
hi rubyClassName              guifg=#FFFF40 ctermfg=227  gui=BOLD cterm=BOLD cterm=BOLD
hi rubyClassVariable          guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi rubyConditional            guifg=#00A787 ctermfg=36   gui=NONE cterm=NONE
hi rubyConstant               guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi rubyControl                guifg=#00A787 ctermfg=36   gui=NONE cterm=NONE
hi rubyComment                guifg=#757E92 ctermfg=244  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC cterm=NONE
hi rubyDefine                 guifg=#7B68FF ctermfg=99   gui=NONE cterm=NONE
hi rubyDoBlock                guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi rubyException              guifg=#E9475A ctermfg=167  gui=NONE cterm=NONE
hi rubyExceptional            guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi rubyFloat                  guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi rubyFunction               guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi rubyGlobalVariable         guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi rubyInclude                guifg=#E080FF ctermfg=177  gui=NONE cterm=NONE
hi rubyInstanceVariable       guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi rubyInteger                guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi rubyInterpolation          guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi rubyInterpolationDelimiter guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi rubyKeyword                guifg=#00A787 ctermfg=36   gui=NONE cterm=NONE
hi rubyMacro                  guifg=#9C4AC0 ctermfg=133  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC cterm=NONE
hi rubyMethodBlock            guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi rubyMethodDeclaration      guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi rubyModule                 guifg=#7B68FF ctermfg=99   guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC cterm=NONE
hi rubyPredefinedIdentifier   guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi rubyPseudoVariable         guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi rubyRegexp                 guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi rubyRegexpAnchor           guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi rubyRegexpDelimiter        guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi rubyRegexpSpecial          guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi rubyRegexpQuantifier       guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi rubyRailsTestMethod        guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi rubyString                 guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi rubyStringDelimiter        guifg=#00A787 ctermfg=36   gui=NONE cterm=NONE
hi rubySymbol                 guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi rubyReturn                 guifg=#9C4AC0 ctermfg=133  guibg=NONE    ctermbg=NONE gui=BOLD cterm=BOLD cterm=BOLD
hi rubyTodo                   guifg=#FFB633 ctermfg=215  guibg=NONE    ctermbg=NONE gui=BOLD cterm=BOLD cterm=BOLD
hi rspecBeforeAndAfter        guifg=#E080FF ctermfg=177  gui=NONE cterm=NONE
hi rspecGroupMethods          guifg=#E080FF ctermfg=177  gui=NONE cterm=NONE
hi rspecMatchers              guifg=#00A787 ctermfg=36   guibg=NONE    ctermbg=NONE gui=BOLD cterm=BOLD cterm=BOLD
hi rspecMocks                 guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi elixirAlias                guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi elixirAtom                 guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi elixirBlockDefinition      guifg=#F4628D ctermfg=204  gui=NONE cterm=NONE
hi elixirBoolean              guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi elixirDefine               guifg=#E080FF ctermfg=177  gui=NONE cterm=NONE
hi elixirFunctionDeclaration  guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi elixirGuard                guifg=#F4628D ctermfg=204  gui=NONE cterm=NONE
hi elixirInclude              guifg=#7B68FF ctermfg=99   gui=NONE cterm=NONE
hi elixirKeyword              guifg=#F4628D ctermfg=204  gui=NONE cterm=NONE
hi elixirMacroDeclaration     guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi elixirMacroDefine          guifg=#F4628D ctermfg=204  gui=NONE cterm=NONE
hi elixirModuleDefine         guifg=#E080FF ctermfg=177  gui=NONE cterm=NONE
hi elixirModuleDeclaration    guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi elixirNumber               guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi elixirPrivateDefine        guifg=#7B68FF ctermfg=99   gui=NONE cterm=NONE
hi elixirSigil                guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi elixirSigilDelimiter       guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi elixirStringDelimiter      guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi elixirUnusedVariable       guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi elixirVariable             guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi htmlTag                    guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi htmlTagN                   guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi htmlSpecialTagName         guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi htmlEndTag                 guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi htmlArg                    guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi htmlString                 guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi htmlTagName                guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi htmlLink                   guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi htmlComment                guifg=#3C414C ctermfg=238  gui=ITALIC cterm=ITALIC cterm=NONE
hi htmlCommentPart            guifg=#3C414C ctermfg=238  gui=ITALIC cterm=ITALIC cterm=NONE
hi htmlCSSStyleComment        guifg=#AFFF4B ctermfg=155  gui=ITALIC cterm=ITALIC cterm=NONE
hi htmlitalic                 guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC cterm=NONE
hi htmlboldunderlineitalic    guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC,BOLD,UNDERLINE cterm=NONE
hi htmlbolditalic             guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC,BOLD cterm=NONE
hi htmlunderlineitalic        guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC,UNDERLINE cterm=NONE
hi htmlbold                   guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=BOLD cterm=BOLD cterm=BOLD
hi htmlboldunderline          guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=BOLD cterm=BOLD,UNDERLINE cterm=BOLD,UNDERLINE
hi htmlunderline              guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=UNDERLINE cterm=UNDERLINE
hi xmlTag                     guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi xmlEndTag                  guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi xmlAttrib                  guifg=#7B68FF ctermfg=99   gui=NONE cterm=NONE
hi cssAttributeSelector       guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssBackgroundProp          guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssBorderAttr              guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi cssBorderProp              guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssBoxAttr                 guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi cssBackgroundAttr          guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi cssUIAttr                  guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi cssBoxProp                 guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssBraces                  guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi cssColor                   guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi cssColorAttr               guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi cssColorProp               guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssCommonAttr              guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi cssDefinition              guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi cssDefinition              guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssDimensionProp           guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssFontAttr                guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi cssFontProp                guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssFunctionName            guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi cssGeneratedContentProp    guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssNoise                   guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi cssPositioningProp         guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssPositioningAttr         guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi cssPseudoClassId           guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi cssRenderProp              guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssTableProp               guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssTagName                 guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi cssTextAttr                guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi cssTextProp                guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi cssURL                     guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi jsRegexpOr                 guifg=#9C4AC0 ctermfg=133  gui=NONE cterm=NONE
hi jsRegexpAnd                guifg=#9C4AC0 ctermfg=133  gui=NONE cterm=NONE
hi jsRegexpString             guifg=#9C4AC0 ctermfg=133  gui=NONE cterm=NONE
hi jsRegexpCharClass          guifg=#F4628D ctermfg=204  gui=NONE cterm=NONE
hi jsFuncArgs                 guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi jsGlobalObjects            guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi jsFloat                    guifg=#00A787 ctermfg=36   gui=NONE cterm=NONE
hi jsReturn                   guifg=#E080FF ctermfg=177  gui=NONE cterm=NONE
hi jsStorageClass             guifg=#89DDFF ctermfg=117  gui=NONE cterm=NONE
hi jsObjectKey                guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi jsStringS                  guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi jsStringD                  guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi jsParens                   guifg=#7B68FF ctermfg=99   gui=NONE cterm=NONE
hi jsNoise                    guifg=#7B68FF ctermfg=99   gui=NONE cterm=NONE
hi jsOperator                 guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi jsFuncAssignExpr           guifg=#3C414C ctermfg=238  gui=NONE cterm=NONE
hi sshConfigHostSect          guifg=#10B0FF ctermfg=39   gui=BOLD cterm=BOLD cterm=BOLD
hi sshConfigHostPort          guifg=#89DDFF ctermfg=117  gui=BOLD cterm=BOLD cterm=BOLD
hi sshConfigKeyword           guifg=#7B68FF ctermfg=99   gui=NONE cterm=NONE
hi sshconfigPreferredAuth     guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi sshconfigNumber            guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE
hi neoSnippetExpandSnippets   guifg=#3C414C ctermfg=238  guibg=#3C414C ctermbg=238  gui=UNDERLINE cterm=UNDERLINE
hi yamlKey                    guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi yamlScalar                 guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi yamlDelimiter              guifg=#757E92 ctermfg=244  gui=NONE cterm=NONE
hi yamlOperator               guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi ansibleRepeat              guifg=#10B0FF ctermfg=39   gui=NONE cterm=NONE
hi ansibleConditional         guifg=#F4628D ctermfg=204  gui=NONE cterm=NONE
hi jinjaVarBlock              guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi jinjaVarDelim              guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi jinjaVariable              guifg=#60E95C ctermfg=77   gui=NONE cterm=NONE
hi jinjaAttribute             guifg=#AFFF4B ctermfg=155  gui=NONE cterm=NONE

