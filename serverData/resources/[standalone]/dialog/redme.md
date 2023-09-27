[NOT MINE THIS WAS GIVEN TO MY BY A FRIND TO GIVE YOU GUYS]
--  TRUE OR FALSE

 if exports['dialog']:Decision("QUSTION", 'ARE YOU SURE?', '', 'YES', 'NO').action == 'submit' then
     print("false")
 else
    print("no")
 end   

--  NUMBER GET 

local data = exports['dialog']:Create("QUSTION", 'PES BALUE')
local amount = tonumber(data.value)

if amount and amount >= 1 then
    print("value +>" ..amount)
else
    print("off")
end    