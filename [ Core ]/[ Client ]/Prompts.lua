--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Prompt_Guarma = nil
Prompt_Casino = nil
Prompt_Jail   = nil
Prompt_Guarma_sDenis = nil
Group = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetDenisPrompts()
  CreateThread(function()
    -- Set Prompt to Guarma
    local str = 'Guarma'
    Prompt_Guarma = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Guarma, _Keys['G'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Guarma, str)
    PromptSetEnabled(Prompt_Guarma, true)
    PromptSetVisible(Prompt_Guarma, true)
    PromptSetHoldMode(Prompt_Guarma, true)
    PromptSetGroup(Prompt_Guarma, Group)
    PromptRegisterEnd(Prompt_Guarma)

    -- Set Prompt to Guarma
    local str = 'Casino Boat'
    Prompt_Casino = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Casino, _Keys['C'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Casino, str)
    PromptSetEnabled(Prompt_Casino, true)
    PromptSetVisible(Prompt_Casino, true)
    PromptSetHoldMode(Prompt_Casino, true)
    PromptSetGroup(Prompt_Casino, Group)
    PromptRegisterEnd(Prompt_Casino)

    -- Set Prompt to the jail
    local str = 'Sisika Jail'
    Prompt_Jail = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Jail, _Keys['X'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Jail, str)
    PromptSetEnabled(Prompt_Jail, true)
    PromptSetVisible(Prompt_Jail, true)
    PromptSetHoldMode(Prompt_Jail, true)
    PromptSetGroup(Prompt_Jail, Group)
    PromptRegisterEnd(Prompt_Jail)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetGuarmaPrompts()
  CreateThread(function()
    -- Set Prompt to Guarma
    local str = 'Saint Denis'
    Prompt_Guarma_sDenis = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Guarma_sDenis, _Keys['E'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Guarma_sDenis, str)
    PromptSetEnabled(Prompt_Guarma_sDenis, true)
    PromptSetVisible(Prompt_Guarma_sDenis, true)
    PromptSetHoldMode(Prompt_Guarma_sDenis, true)
    PromptSetGroup(Prompt_Guarma_sDenis, Group)
    PromptRegisterEnd(Prompt_Guarma_sDenis)
  end)
end











--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
