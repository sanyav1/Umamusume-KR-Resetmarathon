function main_algorithm()

	ret_SSR = {}
	ret_SR = {}
	ret_R = {}
		
	SSR = "SSR"
	SR = "SR"
	R = "R"
	
	print("-----SUPPORT CARD RECOGNITION START-----")
	cycle_total = 0
	ERR_CHECK = 0


	while cycle_total < 10 do
		
		for i=1, 10 do
			ret, acc, ix, iy, sx, sy = imSearch('SSR', roi[i])
			if ret == 0 then
				ret_SSR[i] = 2
			else
				ret_SSR[i] = ret
			end

			-- ret, acc, ix, iy, sx, sy = imSearch('SR', roi[i])
			-- if ret == 0 then
			-- 	ret_SR[i] = 0
			-- else
			-- 	ret_SR[i] = ret
			-- end

			-- ret, acc, ix, iy, sx, sy = imSearch('R', roi[i])
			-- if ret == 0 then
			-- 	ret_R[i] = 0
			-- else
			-- 	ret_R[i] = ret
			-- end

			-- if(ret_SSR[i] + ret_SR[i] + ret_R[i]) ~= 1 then
			-- 	break
			-- end
			
			Sleep(100)
		end

		cycle_total = cycle_total + 1
		
		Sleep(100)
	end

	Sleep(100)

	for i=1, 10 do
		if ret_SSR[i] == 1 then
			SSR_ON = true

			Mouse(LBUTTON, CLICK, roi[i][1], roi[i][2], roi[i][1], roi[i][2], 0, 0, 0.3, 1, FASTER, MESSAGE)
			Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTEST, MESSAGE)

			Sleep(1000)
			
			acc_index = find_best_acc(detail_roi)

			if (found_uma_list[acc_index] == nil) or (found_uma_list[acc_index] == 0) then
				found_uma_list[acc_index] = 1
			else
				found_uma_list[acc_index] = found_uma_list[acc_index] + 1
			end

			err = loopstep("closeInfo", "pickAgain", LOOP_ERR_MEDIUM, {true, 0,0})
			if err_judge(err) > 0 then return 0 end
		end
	end

	return 0
end

AGAIN = true

while AGAIN == true do
	err = loopstep("supportPick", "gachaSkip", LOOP_ERR_MEDIUM, {true, 0,0})
	if err_judge(err) > 0 then return 0 end
    
	err = loopstep("gachaSkip", "pickAgain", LOOP_ERR_MEDIUM, {true, 0,0})
	if err_judge(err) > 0 then return 0 end
	
	main_run = main_algorithm()
	
	Sleep(1000)

	err = loopstep("pickAgain", "confirmPick", LOOP_ERR_MEDIUM, {true, 0,0})
	if err_judge(err) > 0 then return 0 end

	check_end = loopstep_or("noJewel", "supportPick", math.floor(LOOP_ERR_SMALL/8))

	if check_end == 1
	then
		print("Picked up "..tostring(freeCycle*10).." gachas")
		AGAIN = false
		break
	end

	freeCycle = freeCycle + 1
end

EnableImage(true,'toAssess')