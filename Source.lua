local Asico = {}
local usingbasicmain = false
local console = false
local usingValue = false
local service = false

Asico.service = function(a)
	if a ~= 'Nigga' then
		service = true
	end
end
Asico.package = function(packagevalue)
	if packagevalue == 'main' then
		usingbasicmain = true
	end
end

Asico.using = function(space)
	if space == 'dxf' then
		console = true
	elseif space == 'osl' then
		usingValue = true
	end
end

Asico.cout = function(c, ending)
	if usingbasicmain == false or console == false or service == false then return error("can't using console services") end
	if string.sub(c,1,8) == 'cout << ' and string.find(c, 'dxf::endl') then
		c = string.gsub(c, 'dxf::endl', '')
		print(string.sub(c,9))
	else
		return error()
	end
end

Asico.count = function(a,b)
	return math.random(a,b)
end

Asico.plus = function(number,plusnumber)
	if usingValue == false then return error("can't using math") end
	return number + plusnumber
end

Asico.minus = function(minusnumber, number)
	if usingValue == false then return error("can't using math") end
	return minusnumber - number
end

Asico.version = function()
	return 'Currently Version 0.0.1'
end

return Asico
