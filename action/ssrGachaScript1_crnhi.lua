err = loopstep("ssrPick", "gachaSkip", 30, {true, 0,0})
if err_judge(err) > 0 then return 0 end

err = loopstep("gachaSkip", "ssrResult", 30, {true, 0,0})
if err_judge(err) > 0 then return 0 end

err = loopstep("ssrResult", "supportInfo", 30, {true, 200,320})
if err_judge(err) > 0 then return 0 end

detail_roi = {28, 73, 109, 144}

Sleep(1000)

acc_index = find_best_acc(detail_roi)

if (found_uma_list[acc_index] == nil) or (found_uma_list[acc_index] == 0) then
	found_uma_list[acc_index] = 1
else
	found_uma_list[acc_index] = found_uma_list[acc_index] + 1
end

err = loopstep("closeInfo", "closeOk", LOOP_ERR_MEDIUM, {true, 0,0})
if err_judge(err) > 0 then return 0 end

err = loopstep("closeOk", "gachaStandby", LOOP_ERR_LARGE, {true, 0,0})
if err_judge(err) > 0 then return 0 end

SSR_LOTS = false