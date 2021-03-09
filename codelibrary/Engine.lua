--KESH Source
function output(callback)
print(callback)
end

function iterLoop(callback, mode, tble)
if mode == "out" then
for i,v in pairs(callback) do
output(v)
end
elseif mode == "addTable" then
for i,v in pairs(callback) do
tble.insert(v)
end
elseif mode == "custom" then
cI = ""
for i,v in pairs(callback) do
cI = v
tble()
end
end
end

function br()
print("\n")
end

function randNumb(val1, val2)
return math.random(val1, val2)
end

local checkFuncV = false
function CheckFunc()
  if checkFuncV == true then
  checkFuncV = false
  return false
  elseif checkFuncV == false then
  checkFuncV = true
  return true
  end
end

function input(msg)
io.write(msg)
return io.read()
end

function opFile(file , mode)
return io.open(file, mode)
end
function CreateFile(file)
  local file = io.open(file, "a")
  file:close()
end
--//Encryption Stuff\\
--Base64 Encode/Decode
function b64Encode(data)
b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end
function b64Decode(data)
b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end
--Hex Encode/Decode
hex = {}
 
local HexToDec={
 ['0'] = 0,  ['1'] = 1,  ['2'] = 2,  ['3'] = 3,
 ['4'] = 4,  ['5'] = 5,  ['6'] = 6,  ['7'] = 7,
 ['8'] = 8,  ['9'] = 9,  ['A'] = 10, ['B'] = 11,
 ['C'] = 12, ['D'] = 13, ['E'] = 14, ['F'] = 15,
 ['A'] = 10, ['B'] = 11, ['C'] = 12, ['D'] = 13,
 ['E'] = 14, ['F'] = 15
}
 
local DecToHex='0123456789ABCDEF'
 
function char(S, i)  
   local B1 = HexToDec[S:sub(i,i)]
   local B2 = HexToDec[S:sub(i+1,i+1)]
   local C = B1 *16 + B2
   return C
end

function hexDecode(S)
   local D = S:gsub("%s", '')
   D = D:gsub("\n", '')
 
   local T = {}
   local i = 1
   local c = 1
   while (i < #D ) do
      local C = char(D,i)
      i = i + 2
      T[c] = string.char(C)
      c = c + 1
   end
   return table.concat(T)
end
 
function hexEncode(S)
   local T = {}
   local j = 1
   local B
   for i=1, #S do
      B = S:byte(i) / 16 + 1
      T[j] = DecToHex:sub(B,B)
      B = S:byte(i) % 16 + 1
      T[j+1] = DecToHex:sub(B,B)
      j = j + 2
   end
   return table.concat(T)
end

function warn(msg)
print('\27[31m' .. msg .. '\27[0m')
end

function wLoop(code)
  while true do
    code()
  end
end