runtime! syntax/groovy.vim
syn keyword jenkinsfileCoreStep checkout
syn keyword jenkinsfileCoreStep node
syn keyword jenkinsfileCoreStep scm
syn keyword jenkinsfileCoreStep sh
syn keyword jenkinsfileCoreStep stage
syn keyword jenkinsfileCoreStep step
syn keyword jenkinsfileCoreStep options

syn keyword jenkinsfilePluginStep docker
syn keyword jenkinsfilePluginStep junit
syn keyword jenkinsfilePluginStep pipeline

syn keyword jenkinsfileWrapperStep withCredentials
syn keyword jenkinsfileWrapperStep withEnv
syn keyword jenkinsfileWrapperStep ansiColor
syn keyword jenkinsfileWrapperStep timestamps
syn keyword jenkinsfileWrapperStep script
syn keyword jenkinsfileWrapperStep options
syn keyword jenkinsfileWrapperStep properties
syn keyword jenkinsfileWrapperStep stages
syn keyword jenkinsfileWrapperStep steps

hi link jenkinsfileCoreStep Function
hi link jenkinsfilePluginStep Include
hi link jenkinsfileWrapperStep Statement

let b:current_syntax = "jenkinsfile"
