function! fern#scheme#file#mapping#project_top#init(disable_default_mappings) abort
  nnoremap <buffer><silent> <Plug>(fern-action-project-top) :<C-u>call <SID>call('project_top')<CR>

  if !a:disable_default_mappings
        \ && !g:fern#mapping#project_top#disable_default_mappings
    nmap <buffer><nowait> ^ <Plug>(fern-action-project-top)
  endif
endfunction

function! s:call(name, ...) abort
  return call(
        \ 'fern#mapping#call',
        \ [funcref(printf('s:map_%s', a:name))] + a:000,
        \)
endfunction

function! s:map_project_top(helper) abort
  let root = a:helper.sync.get_root_node()
  let path = root._path
  let path = finddir('.git/..', path . ';')
  execute printf('Fern %s', fnameescape(path))
endfunction

let g:fern#scheme#file#mapping#project_top#disable_default_mappings =
      \ get(g:, 'fern#scheme#file#mapping#project_top#disable_default_mappings', 0)
