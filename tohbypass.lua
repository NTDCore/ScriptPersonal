for _, v in getgc() do
	if type(v) == 'function' and debug.getinfo(v).name == 'kick' then
		hookfunction(v, function(...)
			print(`[HOOKED]: {...}`)

			return nil
		end)
	end
end