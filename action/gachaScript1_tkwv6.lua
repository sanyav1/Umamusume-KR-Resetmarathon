if SSR_LOTS == true then
	print("-----STARTING SSR GACHA-----")

	loopcount = 0
	loopcount_max = 12
	while loopcount <= loopcount_max 
	do
		if IsStop() == 1 then
			print("isstop")
			return 22
		end

		ret, acc, ix, iy, sx, sy = ImageSearch('ssrGuaranteed')
		print(ret)

		-- Search until proper gacha menus is on
		if ret == 1 then
			break
			print("BREAKING OUT")
		else
			Mouse(LBUTTON, CLICK, 19, 434, 19, 434, 0, 0, 0.5, 1, FASTER, MESSAGE)
			Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTER, MESSAGE)
		end
	
		Sleep(1000)
	end
	
	if loopcount >= loopcount_max - 1 then
		ErrorCall()
		return 0
	end
	
	-- When finished entering SSR gacha menu
	err = LoopstepBoth("ssrGuaranteed", "pickOnce", LOOP_ERR_SMALL)
	if ErrorJudge(err) > 0 then return 0 end

	-- Start picking
	err = Loopstep("pickOnce", "ssrConfirm", LOOP_ERR_SMALL, {true, 0,0})
	if ErrorJudge(err) > 0 then return 0 end

	-- Pass reconition processs to the next step
	EnableImage(true, "ssrGacha")
	EnableImage(false, "selectGacha")
	GotoImage("ssrGacha")
	return 0
else
	print("-----STARTING PLAIN GACHA-----")

	loopcount = 0
	loopcount_max = 12
	while loopcount <= loopcount_max
	do
		ret, acc, ix, iy, sx, sy = ImageSearch("support")
		
		-- Search until proper gacha menus is on
		if ret == 1 then
			break
		else
			Mouse(LBUTTON, CLICK, 378, 433, 378, 433, 0, 0, 0.5, 1, FASTER, MESSAGE)
			Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTER, MESSAGE)
		end

		Sleep(1500)
	end

	if loopcount >= loopcount_max - 1 then
		ErrorCall()
		return 0
	end
	
	-- When finished entering support gacha menu
	err = LoopstepBoth("support", "pick10", LOOP_ERR_SMALL)
	if ErrorJudge(err) > 0 then return 0 end

	-- Start picking
	err = Loopstep("pick10", "supportPick", LOOP_ERR_SMALL, {true, 0,0})
	if ErrorJudge(err) > 0 then return 0 end

	-- Pass reconition ans cycle loop process to the next step
	EnableImage(true, "supportGacha")
	EnableImage(false, "selectGacha")
	GotoImage("supportGacha")
end