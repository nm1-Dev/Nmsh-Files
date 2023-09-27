local function registerItemDialog()
    local input = lib.inputDialog("Register a New Item", {
        {type = 'input', label = 'Item code', placeholder = 'yachtcodes', description = 'Unique code identifier for the item.', required = true},
        {type = 'input', label = 'Name', placeholder = 'yachtcodes', description = 'Internal name of the item.', required = true},
        {type = 'input', label = 'Label', placeholder = 'Yacht Access Codes', description = 'Display name for the item.', required = true},
        {type = 'number', label = 'Weight', placeholder = '200', description = 'Numeric weight value of the item. (in grams)', required = true},
        {type = 'input', label = 'Type', placeholder = 'item/weapon', description = 'Category or type of the item.', required = true},
        {type = 'input', label = 'Image Path', placeholder = 'yachtcodes.png / yachtcodes.jpg', description = 'Item image name', required = true},
        {type = 'checkbox', label = 'Is unique?', checked = true},
        {type = 'checkbox', label = 'Is useable?', checked = true},
        {type = 'checkbox', label = 'Should Close?', checked = true},
        {type = 'input', label = 'Combinable', placeholder = 'casinocodes', description = 'Other items this can be combined with. Leave empty if not combinable.'},
        {type = 'textarea', label = 'Description', placeholder = 'The first half of codes for the Yacht', description = 'Detailed description about the item.', required = true, min = 1, max = 4, autosize = true}
    })
    return input
end

local function registerJobDialog()
    return lib.inputDialog("Register a New Job", {
        {type = 'input', label = 'Job Code', placeholder = 'jobcode', description = 'Unique name for the job', required = true},
        {type = 'input', label = 'Job Label', placeholder = 'Job Label', description = 'Public name for the job', required = true},
        {type = 'input', label = 'Type', placeholder = 'jobtype', description = 'Category or type of the job.'},
        {type = 'checkbox', label = 'Default Duty?', description = 'Is this job a default duty?', checked = true},
        {type = 'checkbox', label = 'Off Duty Pay?', description = 'Does this job get off-duty pay?', checked = false},
    })
end

local function registerJobGradeDialog()
    return lib.inputDialog("Add a Job Grade (Press 'Cancel' once done)", {
        {type = 'input', label = 'Grade Code', placeholder = '0', description = 'Numeric grade for the job position (ex. 0 for recruit, 1 for officer, etc.)', required = true},
        {type = 'input', label = 'Grade Name', placeholder = 'Grade Name', description = 'Name of the job grade (ex. Recruit, Officer, etc.)', required = true},
        {type = 'checkbox', label = 'Is Boss?', description = 'Is this grade considered a boss position?', checked = false},
        {type = 'number', label = 'Payment', placeholder = '50', description = 'Payment amount for this grade', required = true},
    })
end

RegisterNetEvent('nmsh-itemcreator:client:openItemMenu', function()
    local input = registerItemDialog()
    if not input then return end

    -- Trigger server side event to save the data
    TriggerServerEvent('nmsh-itemcreator:server:saveItem', input)
end)

RegisterNetEvent('nmsh-jobcreator:client:openJobMenu', function(src)
    local jobInput = registerJobDialog()
    if not jobInput then return end  -- If the user cancelled the dialog

    local grades = {}
    while true do
        local gradeInput = registerJobGradeDialog()
        if not gradeInput then break end  -- If the user cancelled the grade dialog

        local gradeCode = gradeInput[1]
        local gradeDetails = {
            name = gradeInput[2],
            isboss = gradeInput[3],
            payment = gradeInput[4]
        }
        grades[gradeCode] = gradeDetails
    end

    local jobData = {
        code = jobInput[1],
        label = jobInput[2],
        type = jobInput[3],
        defaultDuty = jobInput[4],
        offDutyPay = jobInput[5],
        grades = grades
    }

    -- Trigger server side event to save the job data
    TriggerServerEvent('nmsh-jobcreator:server:saveJob', jobData)
end)