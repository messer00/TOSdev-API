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

		-- Grab the initial hijack table
		local hijackTable = _G["HijackTable"];

		-- Check if this is the first time grabbing the table and initialize it
		if hijackTable == nil then
			hijackTable = {}
		end

		-- The first layer if the hijack table is "hijackedFuncString" = functionList {}
		local funcTable = hijackTable[hijackedFuncString];

		-- Check if this is the first time grabbing this function
		if funcTable == nil then
			funcTable = {};

			funcTable[-1] = _G[hijackedFuncString];
			-- dumpTable(_G);
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
					return 0, nil;
				else
					return -1, "A function with that priority already exists";
				end
			else
				funcTable[priority] = newFunc;
			end
		end
		-- Set the initial Tables
		hijackTable[hijackedFuncString] = funcTable
		_G["HijackTable"] = hijackTable

		-- Reevaluate the initial function for the hijacked function
		local val = funcTable[Utils.getLastKeyOfTable(funcTable)];
		_G[hijackedFuncString] = funcTable[Utils.getLastKeyOfTable(funcTable)];

		return priority, nil
	end ,

	getNextHookFunction = function(hijackedFuncString, currentFuncPriority)
		if hijackedFuncString == nil then
			return -1, "Hijacked Function String is nil"
		end

		if currentFuncPriority == nil then
			return -1, "Current Function Priority is nil"
		end
		-- Grab initial table
		local hijackTable = _G["HijackTable"];
		local funcTable = hijackTable[hijackedFuncString];

		-- Now we need to get the next priority which is a decrement until we get to -1 which is the original function
		local keyset = Utils.getSortedKeysOfTable(funcTable)
		local priorityKey = Utils.getKeyForValue(keyset, currentFuncPriority)
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
		return keyset[n];
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
	end
}
