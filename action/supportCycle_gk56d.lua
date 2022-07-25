AGAIN = true

while AGAIN == true do
	err = Loopstep("supportPick", "gachaSkip", LOOP_ERR_MEDIUM, {true, 0,0})
	if ErrorJudge(err) > 0 then return 0 end
    
	err = Loopstep("gachaSkip", "pickAgain", LOOP_ERR_MEDIUM, {true, 0,0})
	if ErrorJudge(err) > 0 then return 0 end
	
	main_run = MainAlgorithm()
	
	Sleep(1000)

	err = Loopstep("pickAgain", "confirmPick", LOOP_ERR_MEDIUM, {true, 0,0})
	if ErrorJudge(err) > 0 then return 0 end

	check_end = LoopstepOr("noJewel", "supportPick", math.floor(LOOP_ERR_SMALL/8))

	if check_end == 1
	then
		print("Picked up "..tostring(freeCycle*10).." gachas")
		AGAIN = false
		break
	end

	freeCycle = freeCycle + 1
end

if FIRST_CYCLE == true then
	EnableImage(true,'toRecordRoom')
	FIRST_CYCLE = false
else
	EnableImage(true,'toAssess')
end