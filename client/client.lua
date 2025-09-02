local currentPage = 1

RegisterNetEvent('guidebook:openBook')
AddEventHandler('guidebook:openBook', function()
    currentPage = 1
    ShowPage()
end)

function ShowPage()
    if not Config.Pages[currentPage] then
        lib.notify({ title = 'Error', description = 'Invalid page', type = 'error' })
        return
    end
    
    local page = Config.Pages[currentPage]
    
    local buttonText = (currentPage < #Config.Pages) and 'Next Page' or 'Close'
    
    local result = lib.alertDialog({
        header = page.title .. ' (' .. currentPage .. '/' .. #Config.Pages .. ')',
        content = page.content,
        centered = true,
        cancel = false,
        labels = {
            confirm = buttonText
        }
    })
    
    
    if result == 'confirm' and currentPage < #Config.Pages then
        currentPage = currentPage + 1
        ShowPage()
    end
   
end