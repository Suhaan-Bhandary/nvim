vim.api.nvim_create_user_command('GoogleSearch', function(args)
    local searchCmd = "google-chrome https://www.google.com/search?q="
    if (args['args']) then
        searchCmd = searchCmd .. '"' .. args['args'] .. '"'
    end

    os.execute(searchCmd .. " > /dev/null")
end, { desc = "Google Search in Chrome", nargs = '*' })
