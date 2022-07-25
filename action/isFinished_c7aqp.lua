if SUCCESS == true then
	print("All Conditions are met")

	for k, v in pairs(found_uma_list)
	do
		if v > 1 then
			print(UMA_LIST[k], v)
		end
	end

	print('Reset Marthons Done : '..tostring(COUNT_CYCLE))
	
	EnableImage(true, "finishAlarm")
	if ALARM_FLAG == 0 then
		GotoImage("alarm0")
	elseif ALARM_FLAG == 1 then
		GotoImage("alarm1")
	else
		GotoImage("alarm2")
	end
else
	uma_off()
	print("It's a long way to go")
	EnableImage(true,'initialize')
	GotoImage('variableSet')
	EnableImage(false,'isFinished')
end

