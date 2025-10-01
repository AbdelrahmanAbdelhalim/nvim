-- ~/.config/nvim/lua/mine/cp.lua
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

-- directory where snippets live
local SNIPPET_DIR = vim.fn.expand("~/.config/nvim/lua/cp_templates")

-- load snippets dynamically from filesystem
local function load_snippets(base_dir)
  local snippets = {}

  if vim.fn.isdirectory(base_dir) ~= 1 then
    vim.notify("Snippet directory not found: " .. base_dir, vim.log.levels.WARN)
    return snippets
  end

  local langs = vim.fn.readdir(base_dir)
  for _, lang in ipairs(langs) do
    local lang_path = base_dir .. "/" .. lang
    if vim.fn.isdirectory(lang_path) == 1 then
      snippets[lang] = {}
      local files = vim.fn.readdir(lang_path)
      for _, file in ipairs(files) do
	 local name = file
        table.insert(snippets[lang], {
            name = name,
            path = lang_path .. "/" .. file,
          })
      end
    end
  end

  return snippets
end

-- insert a file’s contents into buffer
local function insert_file(path)
  local content = vim.fn.readfile(vim.fn.expand(path))
  if not content then
    vim.notify("Failed to read snippet: " .. path, vim.log.levels.ERROR)
    return
  end
  -- insert below current line in normal mode
  vim.api.nvim_put(content, "l", true, true)
end

-- Step 2: pick snippet
local function pick_snippet(lang, snippets_for_lang)
  if not snippets_for_lang or vim.tbl_isempty(snippets_for_lang) then
    vim.notify("No snippets found for language: " .. tostring(lang), vim.log.levels.WARN)
    return
  end

  pickers.new({}, {
    prompt_title = "Choose Snippet (" .. lang .. ")",
    initial_mode = "normal",
    finder = finders.new_table {
      results = snippets_for_lang,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.name,
          ordinal = entry.name,
	  path = entry.path
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    previewer = conf.file_previewer({}),
    attach_mappings = function(_, map)
      local insert = function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if selection and selection.value and selection.value.path then
          insert_file(selection.value.path)
        else
          vim.notify("Could not read selection.", vim.log.levels.ERROR)
        end
      end
      map("i", "<CR>", insert)
      map("n", "<CR>", insert)
      return true
    end,
  }):find()
end

-- Step 1: pick language (or skip if called with lang)
function M.insert_snippet(optional_lang)
  local all_snippets = load_snippets(SNIPPET_DIR)

  if optional_lang and all_snippets[optional_lang] then
    pick_snippet(optional_lang, all_snippets[optional_lang])
    return
  end

  local langs = vim.tbl_keys(all_snippets)
  if vim.tbl_isempty(langs) then
    vim.notify("No snippet languages found in " .. SNIPPET_DIR, vim.log.levels.WARN)
    return
  end

  pickers.new({}, {
    prompt_title = "Choose Language",
    initial_mode = "normal",
    finder = finders.new_table {
      results = langs,
      entry_maker = function(entry)
        -- normalize each language into a proper entry object
        return {
          value = entry,
          display = entry,
          ordinal = entry,
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(_, map)
      local choose_lang = function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if selection and selection.value then
          local lang = selection.value
          -- defensive: ensure that table exists
          if all_snippets[lang] then
            pick_snippet(lang, all_snippets[lang])
          else
            vim.notify("No snippets for language: " .. tostring(lang), vim.log.levels.WARN)
          end
        else
          vim.notify("No language selected.", vim.log.levels.ERROR)
        end
      end
      map("i", "<CR>", choose_lang)
      map("n", "<CR>", choose_lang)
      return true
    end,
  }):find()
end

return M

