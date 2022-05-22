--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
SteamID, CharID = nil, nil
Loc, AliveNPCs = 'sDenis', {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Set Users SteamID
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.FastTavel) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Data = TCTCC('DokusCore:Sync:Get:UserData')
    SteamID, CharID = Data.SteamID, Data.CharID
    UIFadeIn(1000)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create the map markers and spawn the bank npcs
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.FastTavel) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    for k,v in pairs(_FastTravel.Zones) do SetBlip(v.Coords, -1505442625, 1.0, 'Fast Travel') end
    for k,v in pairs(_FastTravel.NPCs) do
      Tabi(AliveNPCs, SpawnNPC(v.Hash, v.Coords, v.Heading))
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.FastTavel) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(1000)
      for k,v in pairs(_FastTravel.Zones) do
        local Dist = GetDistance(v.Coords)
        if ((Dist <= v.Radius)) then
          InRange, Loc = true, v.ID
          if (Low(Loc) == 'sdenis') then SetDenisPrompts() end
          if (Low(Loc) == 'guarma') then SetGuarmaPrompts() end
          while InRange do Wait(1)
            local Name  = CreateVarString(10, 'LITERAL_STRING', 'Traveller')
            PromptSetActiveGroupThisFrame(Group, Name)
            local G = PromptHasHoldModeCompleted(Prompt_Guarma)
            local C = PromptHasHoldModeCompleted(Prompt_Casino)
            local J = PromptHasHoldModeCompleted(Prompt_Jail)
            local S = PromptHasHoldModeCompleted(Prompt_Guarma_sDenis)

            if ((G)) then TriggerEvent('DokusCore:FastTavel:Teleport:Guarma') Wait(10000) end
            if ((C)) then TriggerEvent('DokusCore:FastTavel:Teleport:Casino') Wait(10000) end
            if ((J)) then TriggerEvent('DokusCore:FastTavel:Teleport:Jail')   Wait(10000) end
            if ((S)) then TriggerEvent('DokusCore:FastTavel:Teleport:sDenis') Wait(10000) end
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.FastTavel) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    for k,v in pairs(_FastTravel.Locations) do
      for k,v in pairs(v.Data) do
        local str = v.ID
        Prompt = PromptRegisterBegin()
        PromptSetControlAction(Prompt, _ActionKey)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Prompt, str)
        PromptSetEnabled(Prompt, true)
        PromptSetVisible(Prompt, true)
        PromptSetHoldMode(Prompt, true)
        PromptSetGroup(Prompt, Group)
        PromptRegisterEnd(Prompt)
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
