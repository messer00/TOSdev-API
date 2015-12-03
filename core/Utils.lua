return {

	hijack = function(hijackedFuncString, newFunc, priority)

		if hijackedFuncString == nil then
			return -1, "Hijacked Function String is nil"
		end

		if newFunc == nil then
			return -1, "New Function to call is nil"
		end

		if priority == nil then
			priority = -1
		end

		-- Grab the initial hijack table
		local hijackTable = _G["HIJACK_TABLE"]

		-- Check if this is the first time grabbing the table and initialize it
		if hijackTable == nil then
			hijackTable = {}
		end

		-- The first layer if the hijack table is "hijackedFuncString" = functionList {}
		local funcTable = hijackTable[hijackedFuncString];

		-- Check if this is the first time grabbing this function
		if funcTable == nil then
			funcTable = {}
		end

		-- If there is no priority then just add the function to the end
		if priority == -1 then
			-- First find the last value in the priority list
			local keyset
			local n=0

			for k,v in pairs(funcTable) do
			  n=n+1
			  keyset[n]=k
			end
			table.sort(keyset)
			priority = keyset[n] + 1;
			funcTable[priority] = newFunc
		else
			-- Check if that space is available
			if funcTable[priority] ~= nil then
				-- Check if the priority is held by the same function
				if funcTable[priority] == newFunc then
					return 0, nil
				else
					return -1, "A function with that priority already exists"
				end
			else
				funcTable[priority] = newFunc
			end
		end

		-- Set the initial Tables
		hijackTable[hijackedFuncString] = funcTable
		_G["HIJACK_TABLE"] = hijackTable

		return priority, nil
	end, 

	function getNextHookFunction(hijackedFuncString, currentFuncPriority)
		if hijackedFuncString == nil then
			return -1, "Hijacked Function String is nil"
		end

		if currentFunc == nil then
			return -1, "Current Function Priority is nil"
		end

		local hijackTable = _G["HIJACK_TABLE"];
		local funcTable = hijackTable[hijackedFuncString];
		local func = funcTable[priority];

		return func, nil;

	end
}
