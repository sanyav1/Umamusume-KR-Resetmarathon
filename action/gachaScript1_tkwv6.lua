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