assert(messagebox, 'Not support')

local MessageBox = {}
function MessageBox.new(caption: string, text: string, style: number, callback: table): ()
	local Output: {[string]: number} = {
		OK = 1,
		Cancel = 2,
		Abort = 3,
		Retry = 4,
		Ignore = 5,
		Yes = 6,
		No = 7,
		TryAgain = 10,
		Continue = 11
	}
	local box: number = messagebox(text, caption, style)
	local idx: string
	for _, v in Output do
		if v == box then
			idx = _
			break
		end
	end

	if idx and callback[idx] then
		callback[idx]()
	end
end

return MessageBox