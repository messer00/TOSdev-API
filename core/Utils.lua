return {

	hijack = function(hijackedFuncString, newFunc, priority)
		if hijackedFuncString == nil then
			return -1, "Hijacked Function String is nil";
		end

		if newFunc == nil then
			return -1, "New Function to call is nil";
		end

		if priority == nil then
			priority = -1;
		end

		-- Check if this is the first time grabbing the table and initialize it
		if _G["HijackTable"] == nil then
			_G["HijackTable"] = {}
		end

		-- The first layer if the hijack table is "hijackedFuncString" = functionList {}
		local funcTable = _G["HijackTable"][hijackedFuncString];

		-- Check if this is the first time grabbing this function
		if funcTable == nil then
			funcTable = {};
			funcTable[-1] = _G[hijackedFuncString];
			-- dumpTable(_G);
		end

		local priorityIfNotNil = Utils.getKeyForValue(funcTable, newFunc);
		if priorityIfNotNil ~= nil then
			return priorityIfNotNil, "The function already exists in the table"
		end
		-- If there is no priority then just add the function to the end
		if priority == -1 then
			-- First find the last value in the priority list
			priority = Utils.getLastKeyOfTable(funcTable) + 1;
			funcTable[priority] = newFunc;
		else
			-- Check if that space is available
			if funcTable[priority] ~= nil then
				-- Check if the priority is held by the same function
				if funcTable[priority] == newFunc then
					return priority, nil;
				else
					return -1, "A function with that priority already exists";
				end
			else
				funcTable[priority] = newFunc;
			end
		end
		-- Set the initial Tables
		_G["HijackTable"][hijackedFuncString] = funcTable

		-- Reevaluate the initial function for the hijacked function
		local val = funcTable[Utils.getLastKeyOfTable(funcTable)]
		if 	_G[hijackedFuncString] ~= val then
			_G[hijackedFuncString] = val;
		end

		return priority, nil
	end ,

	getNextHookFunction = function(hijackedFuncString, currentFuncPriority)
		if hijackedFuncString == nil then
			return -1, "Hijacked Function String is nil"
		end

		if currentFuncPriority == nil or currentFuncPriority < 0 then
			return -1, "Current Function Priority is nil or invalid"
		end
		-- Grab initial table
		if _G["HijackTable"] == nil then
			return -1, "HijackTable is nil"
		end
		local funcTable = _G["HijackTable"][hijackedFuncString];
		if funcTable == nil then
			return -1, "funcTable is nil"
		end

		-- Now we need to get the next priority which is a decrement until we get to -1 which is the original function
		local keyset = Utils.getSortedKeysOfTable(funcTable)
		if keyset == nil then
			return -1, "Keyset is nil"
		end
		local priorityKey = Utils.getKeyForValue(keyset, currentFuncPriority)
		if priorityKey == nil or priorityKey < 0 then
			return -1, "Priority Key is invalid"
		end
		local func = funcTable[keyset[priorityKey - 1]];

		return func, nil;

	end ,

	getKeyForValue = function( t, value )
	  	for k,v in pairs(t) do
	    	if v == value then

	    		return k;
	    	end
	  	end
	  	return nil
	end ,

	getLastKeyOfTable = function(tableT)
		local keyset = {};
		local n = 0;
		for k, v in pairs(tableT) do
		  	n = n + 1;
		  	keyset[n] = k;
		end
		table.sort(keyset)
		local value = keyset[n];
		return value;
	end ,

	getSortedKeysOfTable = function(tableT)
		local keyset = {};
		local n = 0;

		for k, v in pairs(tableT) do
		  n = n + 1;
		  keyset[n] = k;
		end
		table.sort(keyset)
		return keyset;
	end,

	refreshHijackTable = function()
		if _G["HijackTable"] == nil then
			return
		end
		for k,v in pairs(_G["HijackTable"]) do
			_G[k] = v[-1];
		end
		_G["HijackTable"] = nil;
	end
}
