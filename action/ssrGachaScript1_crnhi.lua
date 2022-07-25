err = Loopstep("ssrPick", "gachaSkip", 30, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("gachaSkip", "ssrResult", 30, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("ssrResult", "supportInfo", 30, {true, 200,320})
if ErrorJudge(err) > 0 then return 0 end

detail_roi = {28, 73, 109, 144}

Sleep(1000)

acc_index = FindBestAcc(detail_roi)

if (found_uma_list[acc_index] == nil) or (found_uma_list[acc_index] == 0) then
	found_uma_list[acc_index] = 1
else
	found_uma_list[acc_index] = found_uma_list[acc_index] + 1
end

err = Loopstep("closeInfo", "closeOk", LOOP_ERR_MEDIUM, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("closeOk", "gachaStandby", LOOP_ERR_LARGE, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

SSR_LOTS = false