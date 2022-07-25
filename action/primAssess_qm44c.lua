print('MAIN_FLAG = '..tostring(MAIN_FLAG))
print("MUST : " ..tostring(calculate_mustfind()[1]))
print("SELECT : " ..tostring(calculate_selectfind()[1]))
print("SCORE : " ..tostring(calculate_score()[1]))

if calculate_mustfind()[1] == true
then
	SCREENSHOT_FLAG = true
	if MAIN_FLAG == 0 then
		if calculate_selectfind()[1] == true 
		then
			SUCCESS = true
		end
		
	elseif MAIN_FLAG == 1 then
		if calculate_score()[1] == true 
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
