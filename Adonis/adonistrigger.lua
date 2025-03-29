for i, v in getgc(true) do
	if typeof(v) == "table" and rawget(v,'Detected') then
		table.foreach(v, function(a, b)
			if type(b) == 'function' then
				v.Detected('log', 'get false detected')
			end
		end)
	end
end