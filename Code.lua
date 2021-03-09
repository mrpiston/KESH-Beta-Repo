--Hello World Project
output("1 = sign up | 2 = login") --prints out options
op = input("Enter an option: ") --enter option
if op == "1" then --Check option
x = input("Enter a name: ") --Name
p1 = input("Enter a password: ") --input to the client
p2 = input("ReEnter password: ") --input to the client
if p1 == p2 then -- checks if the password is correct
str = x .. " | " .. p1 --Make a string to encrypt with the username and password
str2 = b64Encode(str) --Encoding the string with base64
finalString = hexEncode(str2) --Adding a second layer of encryption to the string with hex
finalString2 = b64Encode(finalString) --More encryption
finalString3 = hexEncode(finalString2) --More encryption
file = opFile("users.txt", "a") --Open the file with append premisions
file:write("\n" .. finalString3) --Write to the file
file:close() --Close file and save changes
output("Sucessfully made an account!") --Tells the client that they have made an account
else --If the passwords did not match
warn("passwords did not match!") --output a string but with red text
end --ends the password check
elseif op == 2 then -- checks if the option was 2

end --end of hello world project