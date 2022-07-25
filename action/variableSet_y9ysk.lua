--유의사항!!!!!!
--combo에서 온 index와 실제 UMA_LIST의 index는 1 차이남

-- combo	:: 0 ~ N-1
-- UMA_LIST :: 1 ~ N

for k, img in pairs(GROUPS)
do
	EnableImage(false, img)
end

print("_____________________________")

-- 세션과 연결되었는가
if device_name == nil then 
	Stop()
	MessageBox(START_ERR_MESSAGE_SESSION)
end

local date_now = os.date('*t')
print("현재 시각 : "..tostring(date_now.hour))
if date_now.hour == 4 then
	if date_now.min > 55 then
		print("날짜변경시간에 도달, 5분간 대기합니다.")
		Sleep(1000*60*5)
		Sleep(1000*30)
	end
end

found_uma_list = {}
print("리세횟수 : "..tostring(COUNT))
print("<<필수목표>>")

for k, v in pairs(LIST[STR_MUSTFIND_LIST]) do
	name_idx = LIST[STR_MUSTFIND_LIST][k][STR_NAME]
	name_idx = name_idx + 1
	name_n = LIST[STR_MUSTFIND_LIST][k][STR_NUM]
	
	if name_idx > 1 then
		print(tostring(UMA_LIST[name_idx]).." : "..tostring(name_n))
	end
end

print("<<선택목표>>")

for k, v in pairs(LIST[STR_SELECTFIND_LIST]) do
	name_idx = LIST[STR_SELECTFIND_LIST][k][STR_NAME]
	name_idx = name_idx + 1
	name_n = LIST[STR_SELECTFIND_LIST][k][STR_NUM]
	
	if name_idx > 1 then
		print(tostring(UMA_LIST[name_idx]).." : "..tostring(name_n))
	end
end

print("<<점수목표>>")
if  tonumber(SCOREGOAL) == 0 then
	print("점수 목표가 존재하지 않습니다")
else
	print("목표점수 : "..tostring(SCOREGOAL))
end

for k, v in pairs(LIST[STR_SCOREFIND_LIST]) do
	name_idx = LIST[STR_SCOREFIND_LIST][k][STR_NAME]
	name_idx = name_idx + 1
	name_n = LIST[STR_SCOREFIND_LIST][k][STR_NUM]
	
	if name_idx > 1 then
		print(tostring(UMA_LIST[name_idx]).." : "..tostring(name_n))
	end
end

print([[_____________]])

-- 연결했는가?
if device_name == nil then 
	Stop()
	MessageBox(START_ERR_MESSAGE_CONNECT)
end

-- FLAG가 있는가?
if MAIN_FLAG == nil or ALARM_FLAG == nil or MAIN_FLAG == -1 or ALARM_FLAG == -1 then
	Stop()
	MessageBox("START_ERR_MESSAGE_VAR")
end	
	
-- 이미 조건이 만족됐는가?
SUCCESS = false
SCREENSHOT_FLAG = false

print("MAIN_FLAG = "..tostring(MAIN_FLAG))
print("SELECT : ".. tostring(calculate_selectfind()[1]))
print("MUSTF : " .. tostring(calculate_mustfind()[1]))
print("SCORE : " .. tostring(calculate_score()[1]))

if calculate_mustfind()[1] == true
then
	SCREENSHOT_FLAG = true
	if MAIN_FLAG == 0 then
		if calculate_selectfind()[1] == true then
			SUCCESS = true
		end
	elseif MAIN_FLAG == 1 then
		if calculate_score()[1] == true then
			SUCCESS = true
		end
	end
end