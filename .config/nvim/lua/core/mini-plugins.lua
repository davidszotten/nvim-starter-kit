function CopyFilename(with_lines)
    local path = vim.fn.expand("%")
    if with_lines
    then
        -- path = path .. ":" .. vim.fn.line("'<'")
        path = path .. ":" .. vim.fn.line("v")
    end
    vim.fn.setreg("*", path)
end

function CloseAllSavedBuffers()
    local last_buffer = vim.fn.bufnr('$')

    for n = 1, last_buffer do
        if vim.fn.buflisted(n) and vim.fn.getbufvar(n, '&modified') == 0
        then
            vim.api.nvim_buf_delete(n, {})
        end
    end
end

function FindSitePackages()
    local py_cmd = 'import sysconfig; print(sysconfig.get_path(\\"purelib\\"))'
    -- local virtualenv = os.execute('python -c "' .. py_cmd .. '"')
    local virtualenv = vim.fn.system('python -c "' .. py_cmd .. '"')
    return string.gsub(virtualenv, "\n", "") .. "/"
end

function FormatJson()
    vim.fn.execute("%!python -m json.tool")
end
