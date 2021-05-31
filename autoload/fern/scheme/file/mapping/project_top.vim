function! fern#scheme#file#mapping#project_top#init(disable_default_mappings) abort
  nnoremap <buffer><silent> <Plug>(fern-action-project-top) :<C-u>call <SID>call('project_top', 0)<CR>
  nnoremap <buffer><silent> <Plug>(fern-action-project-top:reveal) :<C-u>call <SID>call('project_top', 1)<CR>
endfunction

function! s:call(name, ...) abort
  return call(
        \ 'fern#mapping#call',
        \ [funcref(printf('s:map_%s', a:name))] + a:000,
        \)
endfunction

function! s:map_project_top(helper, reveal) abort
  let root = a:helper.sync.get_root_node()
  let path = finddir('.git/..', root._path . ';')
  if empty(path)
    throw 'No project top directory found'
  endif
  if a:reveal
    execute printf(
          \ 'Fern %s -reveal=%s',
          \ fnameescape(path),
          \ fnameescape(a:helper.sync.get_cursor_node()._path),
          \)
  else
    execute printf('Fern %s', fnameescape(path))
  endif
endfunction
