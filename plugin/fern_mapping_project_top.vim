if exists('g:fern_mapping_project_top_loaded')
  finish
endif
let g:fern_mapping_project_top_loaded = 1

call add(g:fern#internal#mapping#mappings, 'project_top')
