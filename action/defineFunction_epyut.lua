LOOP_ERR_SMALL = 50
LOOP_ERR_MEDIUM = 90
LOOP_ERR_LARGE = 160


-- 계정 백업 경로 생성
head_command = "cd ../../ADB && "
adb_command = "adb -s "..device_name.." shell /system/xbin/bstk/su -c mkdir -p /data/data/com.kakaogames.umamusume/account"
command = head_command..adb_command

local f = io.popen(command)
f:close()

-- 스크린샷 바로가기 폴더 만들기
os.execute("mkdir ..\\screenshot")

-- 횟수 세기
COUNT = 0

-- SSR 뽑기
SSR_LOTS = true

function uma_off()
	-- LEGACY METHOD. LEFT JUST FOR CASE
	-- head_command = "cd ../../ADB && "
	-- adb_command = "adb -s "..device_name.." shell /system/xbin/bstk/su -c input keyevent KEYCODE_APP_SWITCH"
	-- command = head_command..adb_command

	-- local f = io.popen(command)
	-- f:close()
	
	-- Sleep(1000)
	
	-- head_command = "cd ../../ADB && "
	-- adb_command = "adb -s "..device_name.." shell /system/xbin/bstk/su -c input keyevent KEYCODE_DEL"
	-- command = head_command..adb_command

	-- local f = io.popen(command)
	-- f:close()
	
	-- Sleep(200)
	
	-- head_command = "cd ../../ADB && "
	-- adb_command = "adb -s "..device_name.." shell /system/xbin/bstk/su -c input keyevent KEYCODE_HOME"
	-- command = head_command..adb_command

	-- local f = io.popen(command)
	-- f:close()

	head_command = "cd ../../ADB && "
	adb_command = "adb -s "..device_name.." shell am force-stop com.kakaogames.umamusume"
	command = head_command..adb_command

	local f = io.popen(command)
	f:close()
end


function error_call()
	print('무한루프에 빠졌습니다.')
	print('처음부터 다시시작합니다.')

	uma_off()
	
	EnableImage(true, 'initialize')
	GotoImage('variableSet')
end

function do_action(action_list, args_list)
	for k, v in action_list
	do
		v(table.unpack(args_list[k]))
	end
end

function err_judge(err)
	if err > 10 then
		if err == 22 then
			print("강제종료됨")
		elseif err == 44 then
			print("카드인식에러")
			error_call()
		elseif err == 99 then
			error_call()
		end

		return 1
	end

	return 0
end

global_delay = 100
function loopstep(now_img, next_img, loopcount_max, mouseact, loopdelay)
	
	loopcount_max = loopcount_max or 10
	loopdelay = loopdelay or 150
	loopcount = 0
	
	print(now_img)

	if IsStop() == 1 then
		print("isstop")
		return 22
	end
	
	mouse_enable, mouse_x, mouse_y = table.unpack(mouseact)
	
	if mouse_x > 0 or mouse_y > 0 then
		specific_enable = true
	else
		specific_enable = false
	end
	
	while loopcount <= loopcount_max
	do
		if IsStop() == 1 then
			print("isstop")
			return 22
		end
	
		ret, acc, ix, iy, sx, sy = ImageSearch(now_img)
		ret_next, acc_next, ix_next, iy_next, sx_next, sy_next = ImageSearch(next_img)

		if ret_next == 1 then
			break
		end
		
		if ret == 1 and mouse_enable == true then
			if specific_enable == true then
				print(mouse_x, mouse_y)
				Mouse(LBUTTON, CLICK, mouse_x, mouse_y, 0, 0, 0, 0, 0.5, 1, FASTER, MESSAGE)
				Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTER, MESSAGE)
			else
				print(ix, iy)
				Mouse(LBUTTON, CLICK, ix, iy, 0, 0, 0, 0, 0.5, 1, FASTER, MESSAGE)
				Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTER, MESSAGE)
			end
		end
		
		Sleep(loopdelay)
		loopcount = loopcount + 1
	end
	
	if loopcount > loopcount_max - 1 then
		return 99
	end
	
	Sleep(global_delay)
	return 0
end

function loopstep_both(now_img, next_img, loopcount_max, loopdelay)
	
	loopcount_max = loopcount_max or 10
	loopdelay = loopdelay or 150
	
	print(now_img, next_img)

	if IsStop() == 1 then
		print("isstop")
		return 22
	end
	
	while loopcount <= loopcount_max
	do
		if IsStop() == 1 then
			print("isstop")
			return 22
		end
		
		ret, acc, ix, iy, sx, sy = ImageSearch(now_img)
		ret_next, acc_next, ix_next, iy_next, sx_next, sy_next = ImageSearch(next_img)
		
		if ret == 1 and ret_next == 1 then
			break
		end
	end
	
	if loopcount >= loopcount_max - 1 then
		return 99
	end
	
	Sleep(global_delay)
	return 0
end

function loopstep_or(now_img, next_img, loopcount_max, loopdelay)

	loopcount_max = loopcount_max or 10
	loopdelay = loopdelay or 150
	print(now_img)

	if IsStop() == 1 then
		print("isstop")
		return 22
	end
	
	while loopcount <= loopcount_max
	do
		if IsStop() == 1 then
			print("isstop")
			return 22
		end
	
		ret, acc, ix, iy, sx, sy = ImageSearch(now_img)
		ret_next, acc_next, ix_next, iy_next, sx_next, sy_next = ImageSearch(next_img)
		
		if ret == 1 or ret_next == 1 then
			break
		end
	end
		
	if loopcount > loopcount_max - 1 then
		return 99
	end
	
	Sleep(global_delay)
	
	if ret == 1 and ret_next == 0 then
		return 1
	elseif ret == 0 and ret_next == 1 then
		return 2
	else 
		return 0
	end
end


function setClock()
    return os.clock()
end


function getClock(_clock)
    if _clock ~= nil then
        return os.clock() - _clock
    else
        print('getClock() ERROR : _clock is null')
    end
end


function imSearch(_image, _roi)
    SetImageROI(_image, _roi)
    ret, acc, ix, iy, sx, sy = ImageSearch(_image)
	return ret, acc, ix, iy, sx, sy
end


function find_best_acc(_roi)
	accuracy_set = {}
	if FIRST_RUN == true then
		for k, v in pairs(UMA_LIST)
		do	
			print(k, v)
			ret, acc1, ix, iy, sx, sy = imSearch(v,_roi)
			accuracy_set[k] = acc1
		end
		print("FIRST RUN DOES NOT AFFECT THE RESULT")
		print("THIS IS FOR CLEAN INITIALIZATION PURPOSE ONLY")
		FIRST_RUN = false
	end

	accuracy_set = {}
	for k, v in pairs(UMA_LIST)
	do	
		print(k, v)
		ret, acc1, ix, iy, sx, sy = imSearch(v,_roi)
		accuracy_set[k] = acc1
	end

	acc_tmp = 0
	acc_index = 0

	for k, v in pairs(accuracy_set)
	do	
		if (k > 1) and (v > acc_tmp) then
			acc_index = k
			acc_tmp = v
		end
	end
	
	if acc_tmp < 70 then
		acc_index = 999
	end
	
	print("ACC INDEX = "..tostring(acc_index).." : "..UMA_LIST[acc_index])
	return acc_index
end


function calculate_score()
	goal = SCOREGOAL
	score_now = 0
	for k, v in pairs(LIST[STR_SCOREFIND_LIST])
	do
		index = LIST[STR_SCOREFIND_LIST][k][STR_NAME]
		index = index + 1
		n = LIST[STR_SCOREFIND_LIST][k][STR_NUM]
		
		if index > 1
		then
			if found_uma_list[index] ~= nil
			then
				score_now = score_now + tonumber(found_uma_list[index]) * tonumber(n)
			end
		end
	end
	
	if score_now >= tonumber(goal)
	then
		return {true, score_now}
	else
		
		return {false, score_now}
	end
end


function calculate_mustfind()
	
	mustfind_ok = true
	found_index = {}
	for k, v in pairs(LIST[STR_MUSTFIND_LIST])
	do
		index = LIST[STR_MUSTFIND_LIST][k][STR_NAME]
		index = index + 1
		need = LIST[STR_MUSTFIND_LIST][k][STR_NUM]
		
		if index > 1
		then
			if (found_uma_list[index] == nil) or (found_uma_list[index] < need)
			then
				mustfind_ok = false
			else
				table.insert(found_index, index)
			end	
		end		
	end	
	return {mustfind_ok, found_index}
end


function calculate_selectfind()

	selectfind_ok = true
	found_index = {}
	for k, v in pairs(LIST[STR_SELECTFIND_LIST])
	do
		index = LIST[STR_SELECTFIND_LIST][k][STR_NAME]
		index = index + 1
		need = LIST[STR_SELECTFIND_LIST][k][STR_NUM]

		if index > 1
		then
			if (found_uma_list[index] == nil) or (tonumber(found_uma_list[index]) < need)
			then
				selectfind_ok = false
			else
				table.insert(found_index, index)
			end
		
		end
	end
	return {selectfind_ok, found_index}
end


function resetAdress(timeStamp,duration,deviceThether)

	timeEllapsed = os.time() - timeStamp
	print("지난 IP 재설정 이후 경과 시간 (초): "..timeEllapsed)

	if timeEllapsed >= duration then
		head_command = "cd ../../ADB && "
		adb_command_1 = "adb -s "..deviceThether.." shell svc data disable && "
		adb_command_2 = "adb -s "..deviceThether.." shell settings put global airplane_mode_on 1"
		command = head_command..adb_command_1..adb_command_2
	
		local f = io.popen(command)
		f:close()
		
		print("비행기 모드 활성화")
		
		Sleep(500)
		
		head_command = "cd ../../ADB && "
		adb_command_1 = "adb -s "..deviceThether.." shell svc data enable && "
		adb_command_2 = "adb -s "..deviceThether.." shell settings put global airplane_mode_on 0"
		command = head_command..adb_command_1..adb_command_2
	
		local f = io.popen(command)
		f:close()
	
		print("비행기 모드 비활성화")

		return os.time()
	else
		return timeStamp
	end
end