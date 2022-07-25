print('MAIN_FLAG = '..tostring(MAIN_FLAG))
print("MUST : " ..tostring(CalculateMustfind()[1]))
print("SELECT : " ..tostring(CalculateSelectfind()[1]))
print("SCORE : " ..tostring(CalculateScore()[1]))

if CalculateMustfind()[1] == true
then
	SCREENSHOT_FLAG = true
	if MAIN_FLAG == 0 then
		if CalculateSelectfind()[1] == true 
		then
			SUCCESS = true
		end
		
	elseif MAIN_FLAG == 1 then
		if CalculateScore()[1] == true 
		then
			SUCCESS = true
		end
	end
end

if SCREENSHOT_FLAG == true then
	EnableImage(true,'saveDat')
	GotoImage("saveDat")
else
	EnableImage(true,'isFinished')
	GotoImage("isFinished")
end
