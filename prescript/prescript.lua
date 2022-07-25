-- 프로그램 실행시 전처리 스크립트
MAIN_FLAG = 0
ALARM_FLAG = 0
STR_NAME_ID = 'name_id'
STR_NUM_ID = 'num_id'
STR_NAME = 'name'
STR_NUM = 'num'
IS_OK = true
SAFELOCK = 0
START_ERR_MESSAGE_SESSION = "블루스택 세션과 연결해주세요."
START_ERR_MESSAGE_TETHER = "테더링 기기와 연결해주세요."
START_ERR_MESSAGE_VAR = "정지옵션은 모두 골라야합니다."
START_ERR_MESSAGE_SCORE = "목표점수 확정 필요"
START_ERR_MESSAGE_END = "이미 조건을 모두 만족했습니다. 조건을 확인해주세요."
ALARM_MESSAGE = "목표 도달! \n리세마라가 완료되었습니다"
SAFELOCK_MESSAGE = "SAFELOCK, 잠금해제 필요"

UMA_LIST = {
	'선택하지않음',
	'골드쉽',
	'골드시티',
	'그래스원더',
	'나이스네이처',
	'니시노플라워',
	'라이스샤워',
	'보드카',
	'비코페가수스',
	'사일런스스즈카',
	'사쿠라바쿠신오',
	'사토노다이아몬드',
	'세이운스카이',
	'슈퍼크릭',
	'스마트팔콘',
	'스페셜위크',
	'아이네스후진',
	'에어샤커',
	'오구리캡',
	'엘콘도르파사',
	'위닝티켓',
	'카시모토리코',
	'키타산블랙',
	'타마모크로스',
	'토우카이테이오',
	'트윈터보',
	'파인모션',
	'하야카와타즈나'
}


NUM_LIST = {
	'0',
	'1',
	'2',
	'3',
	'4',
	'5'
}

SCORE_LIST = {
	'0',
	'1',
	'2',
	'3',
	'4',
	'5',
	'6',
	'7',
	'8',
	'9',
	'10'
}

STR_MUSTFIND_LIST = 'mustfind_list'
STR_SELECTFIND_LIST = 'selectfind_list'
STR_SCOREFIND_LIST = 'scorefind_list'

STR_VAR_MUSTFIND = '_mustselect'
STR_VAR_SELECTFIND = '_selectfind'
STR_VAR_SCOREFIND = '_scorefind'

LIST = {mustfind_list={}, selectfind_list={}, scorefind_list={}}

GUIAddTab('연결')
GUIAddTab('사용자')
GUIAddTab('선택')
GUIAddTab('점수')
GUIAddTab('HELP')
GUIAddTab('Editor')


GUI_ETC_LIST = {}



-- ########################## 연결
GUISetCurTab('연결')

GUIAddText(5, 0, 340, -1, '블루스택과 연결합니다. 블루스택 ADB 설정을 켜주세요.')

x, y, w, h = 5, 40, 350, 180
GUIAddGroup(x, y, w, h, 'ADB 연결')

GUIAddText(x, y + 10, 340, -1, 'ADB 포트를 확인 후 정확히 입력해주세요')

GUIAddEdit(x, y + 30, 240, -1, '', nil, 'adb_port')
GUIAddButton(x + 240, y + 30, -1, -1,'Device 연결', 'button_connect_device')

GUIAddButton(x, y+ 60, -1, -1, 'STOP/잠금해제', 'button_stop')
GUIAddButton(x + 140, y + 60, -1, -1, '연결초기화', 'button_reset_server', 'reset_var')
TEST_CONNECT_ID = GUIAddButton(x+240, y + 60, -1, -1, '테스트(창열림)', 'button_test_connect', 'test_connect_var')

GUIAddText(x, y + 105, 340, -1, 'IP 갱신 기능이 없는 버전입니다.')
GUIAddText(x, y + 150, 340, -1, '■ 중요!!! - 일반 탭의 [인식대상]->[설정]->[대상 창 선택] 확인')

table.insert(GUI_ETC_LIST, TEST_CONNECT_ID)

x, y, w, h = 5, 250, 350, 70
GUIAddGroup(x, y, w, h, '게스트 불러오기 (리세 복원)')
GUIAddText(x, y+10, 340, -1, '예) 5028_220101_010101_010')
GUIAddEdit(x, y+40, 220, -1, '', nil, 'load_name')
GUIAddButton(x+230, y+40, -1, -1, '불러오기', 'button_load', 'load_var')




-- ########################## 사용자
GUISetCurTab('사용자')

GUIAddText(5, 0, -1, -1, '우마무스메 리세마라 ')

x, y, w, h = 5, 40, 350, 80
GUIAddGroup(x, y, w, h, '정지옵션')

MAINRULE_ID_0 = GUIAddRadio(x + 20, y + 10, -1, -1, '선택 ', 'radio_mainrule', '_mainrule')
MAINRULE_ID_1 = GUIAddRadio(x + 120, y + 10, -1, -1, '점수 ', 'radio_mainrule')

GUIAddButton(x + 200, y + 10, -1, -1, 'STOP/잠금해제', 'button_stop')

GUIAddText(x, y + 35, -1, -1, '정지알림 선택')
ALARM_FLAG = 1
_alarm = 1
ALARM_ID_0 = GUIAddRadio(x + 20, y + 60, -1, -1, '메세지팝업 ', 'radio_alarm', '_alarm')
ALARM_ID_1 = GUIAddRadio(x + 120, y + 60, -1, -1, '5초알람 ', 'radio_alarm')
ALARM_ID_2 = GUIAddRadio(x + 200, y + 60, -1, -1, '5초알람+메세지팝업 ', 'radio_alarm')

table.insert(GUI_ETC_LIST, MAINRULE_ID_0)
table.insert(GUI_ETC_LIST, MAINRULE_ID_1)
table.insert(GUI_ETC_LIST,ALARM_ID_0)
table.insert(GUI_ETC_LIST,ALARM_ID_1)
table.insert(GUI_ETC_LIST,ALARM_ID_2)



must_option_num = 3
interval_size = 25
x, y, w, h = 5, 150, 350, 60 + must_option_num * interval_size + 20
GUIAddGroup(x, y, w, h, '포함옵션')
GUIAddText(x + 10, y + 10, -1, -1, '반드시 포함시키고자 하는 카드를 선택합니다.')
GUIAddText(x + 10, y + 30, -1, -1, '이는 게스트 계정과 스크린샷 저장 기준이 됩니다.')
GUIAddText(x + 10, y + 50, -1, -1, '모두 선택하지 않으면 항상 저장됩니다.')

head_y=50
for i=1,must_option_num,1
do
	plus_y = interval_size * i
	tmp_var_name = STR_VAR_MUSTFIND..'name'..tostring(i)
	tmp_var_num = STR_VAR_MUSTFIND..'num'..tostring(i)
	
	tmp_id_1 = GUIAddCombo(x + 10, y + head_y + plus_y, 150, -1, UMA_LIST, 'combo_mustSelect_name', tmp_var_name)
	tmp_id_2 = GUIAddCombo(x + 200, y + head_y + plus_y, -1, -1, NUM_LIST, 'combo_mustSelect_num', tmp_var_num)
	table.insert(LIST[STR_MUSTFIND_LIST], {[STR_NAME_ID]=tmp_id_1,[STR_NUM_ID]=tmp_id_2})
	GUIAddText(x + 170, y + head_y + plus_y, -1, -1, '개수')
end


-- ########################## 선택

GUISetCurTab('선택')

GUIAddText(5, 0, -1, -1, '원하는 카드를 선택합니다. ')
GUIAddText(5, 20, -1, -1, '선택한 카드가 모두 나오면 중단합니다. ')

select_option_num = 8
interval_size = 25
x, y, w, h = 5, 60, 350, 20+select_option_num*interval_size+20
GUIAddGroup(x, y, w, h, '선택옵션')

head_y = 0
for i=1,select_option_num,1
do
	plus_y = interval_size * i
	tmp_var_name = STR_VAR_SELECTFIND..'name'..tostring(i)
	tmp_var_num = STR_VAR_SELECTFIND..'num'..tostring(i)
	tmp_id_1 = GUIAddCombo(x + 10, y + head_y + plus_y, 150, -1, UMA_LIST, 'combo_select_name', tmp_var_name)
	tmp_id_2 = GUIAddCombo(x + 200, y + head_y + plus_y, -1, -1, NUM_LIST, 'combo_select_num', tmp_var_num)
	table.insert(LIST[STR_SELECTFIND_LIST],{[STR_NAME_ID]=tmp_id_1,[STR_NUM_ID]=tmp_id_2})
	GUIAddText(x + 170, y + head_y + plus_y, -1, -1, '개수')
end


-- ########################## 점수

GUISetCurTab('점수')
GUIAddText(5, 0, -1, -1, '카드별로 점수를 측정합니다.')
GUIAddText(5, 20, -1, -1, '점수를 더해 목표점수를 넘으면 중단합니다. ')
GUIAddText(5, 40, -1, -1, '(선택하지않은 카드는 0점, 정수만 허용)')

GUIAddText(5, 70, -1, -1, '목표점수')
SCORE_ID = GUIAddEdit(70, 70, 60, -1, '0', nil, 'SCOREGOAL')
SCORE_CONFIRM_ID = GUIAddButton(130, 70, -1, -1, '확정', 'button_confirm')
SCORE_EDIT_ID = GUIAddButton(180, 70, -1, -1, '수정', 'button_edit')


score_option_num = 9
interval_size = 20
x, y, w, h = 5, 110, 350, 5+score_option_num*interval_size+20
GUIAddGroup(x, y, w, h, '선택옵션')

head_y = 0
for i=1,score_option_num,1
do
	plus_y = interval_size * i
	tmp_var_name = STR_VAR_SCOREFIND..'name'..tostring(i)
	tmp_var_num = STR_VAR_SCOREFIND..'num'..tostring(i)
	tmp_id_1 = GUIAddCombo(x + 10, y + head_y + plus_y, 150, -1, UMA_LIST, 'combo_score_name', tmp_var_name)
	tmp_id_2 = GUIAddEdit(x + 200, y + head_y + plus_y, -1, -1, '0', 'edit_score_num', tmp_var_num)
	table.insert(LIST[STR_SCOREFIND_LIST], {[STR_NAME_ID]=tmp_id_1,[STR_NUM_ID]=tmp_id_2})
	GUIAddText(x + 170, y + head_y + plus_y, -1, -1, '점수')
end


-- ########################## HELP

GUISetCurTab('HELP')
GUIAddText(5, 0, 350, -1, 'FAQ1: 블루스택이 연결이 안돼요!')
GUIAddText(5, 20, 350, -1, '--> 블루스택의 설정에서 ADB 설정을 켜주세요.')
GUIAddText(5, 40, 350, -1, '--> 만일 켜져있다면 PC 재부팅 해주세요.')

GUIAddText(5, 70, 350, -1, 'FAQ2: 매크로가 끝났는데도 버튼선택이 안돼요!')
GUIAddText(5, 90, 350, -1, '--> 사용자 탭의 "STOP/잠금해제" 눌러주세요.')

GUIAddText(5, 120, 350, -1, 'FAQ3: 스크린샷은 어디에 저장되나요?')
GUIAddText(5, 140, 350, -1, '--> Uma폴더의 SavedScreenshot을 누르시면')
GUIAddText(5, 160, 350, -1, '--> 문서/Screenshot/Uma 로 연결되며')
GUIAddText(5, 180, 350, -1, '--> 스크린샷 저장형식은 다음과 같습니다.')
GUIAddText(5, 200, 350, -1, '--> 문서/Screenshot/Uma/저장당시날짜/저장당시날짜시간.png')

GUIAddText(5, 230, 350, -1, 'FAQ4: 불러오기가 안돼요!')
GUIAddText(5, 250, 350, -1, '--> 연결한 블루스택이 파일이름의 device명과 같은지 확인')
GUIAddText(5, 270, 350, -1, '--> 파일명 예) 8200_220624_071427_516')
GUIAddText(5, 290, 350, -1, '--> 이전에 연결했던 블루스택 세션으로 실행')




-- ########################## EDITOR

GUISetCurTab('Editor')
GUIAddText(5, 0, 150, -1, 'made by Qert')
GUIAddText(5, 30, -1, -1, '악의적이거나 상업적인 목적을 제외한 수정 및 배포 자유')
GUIAddText(5, 60, -1, -1, 'Edited by...')
GUIAddText(5, 80, -1, -1, 'ADD_YOUR_NAME        ')
GUIAddText(5, 100, -1, -1, 'ADD_YOUR_NAME        ')
GUIAddText(5, 120, -1, -1, 'ADD_YOUR_NAME        ')



GUIUpdate()
GUIShow()

GUISetCurTab('연결')


-- ######################### 비활성화 GUI 설정
function LIST_enable(constlist, bool)
	if constlist == STR_SCOREFIND_LIST
	then
		GUIItemEnable(SCORE_ID, bool)
	end
	for k, v in pairs(LIST[constlist])
	do	
		GUIItemEnable(LIST[constlist][k][STR_NAME_ID], bool)
		GUIItemEnable(LIST[constlist][k][STR_NUM_ID], bool)
	end	
end

function GUI_enable(bool)
	
	for k, v in pairs(GUI_ETC_LIST)
	do
		GUIItemEnable(v, bool)
	end
	
	LIST_enable(STR_MUSTFIND_LIST, bool)
	LIST_enable(STR_SELECTFIND_LIST, bool)
end

LIST_enable(STR_SCOREFIND_LIST, false)

function initialize_list(constlist, constvar)
	
	for k, v in pairs(LIST[constlist])
	do	
		v_name = constvar..'name'..tostring(k)
		v_num = constvar..'num'..tostring(k)
		LIST[constlist][k][STR_NAME] = _G[v_name]
		LIST[constlist][k][STR_NUM] = _G[v_num]
	end	
end


UMA_LIST[999] = '확인안된카드'

initialize_list(STR_MUSTFIND_LIST, STR_VAR_MUSTFIND)
initialize_list(STR_SELECTFIND_LIST, STR_VAR_SELECTFIND)
initialize_list(STR_SCOREFIND_LIST, STR_VAR_SCOREFIND)

GUIItemEnable(device_combo_id, false)




-- ############################## Functions
function button_reset_server(button_id)
	
	headCmd = "cd ADB && "
	adbCmd = 'adb kill-server'
	appCmd = headCmd..adbCmd
	
	print('ADB 서버 종료')
	
	local f = io.popen(appCmd)
	f:close()
	
end


function button_connect_device(button_id)
	
	if adb_port ~= ''
	then
		target_port = adb_port
		headCmd = "cd ADB && adb connect 127.0.0.1:"..target_port.." &&"
		adbCmd = 'adb devices -l'
		device_name = "127.0.0.1:"..target_port..""

		appCmd = headCmd..adbCmd
		
		print(adb_port)
		
		local f = io.popen(appCmd)

		for line in f:lines()do 
			print(line)
		end
	else
		print("블루스택 ADB 포트가 입력되지 않았습니다. 포트를 입력해주세요.")
		return 0
	end

end

function button_test_connect(button_id)
print(adb_port)
	if adb_port	== ''
		then
		print("블루스택 ADB 포트가 입력되지 않았습니다. 포트를 입력해주세요.")
		return 0
	else
		headCmd = "cd ADB && "
		adbCmd = "adb -s "..device_name.." shell am start -n com.android.settings/com.android.settings.Settings"
		appCmd = headCmd..adbCmd
		
		local f = io.popen(appCmd)

		f:close()
	end
end

function button_load(button_id)
		
	saved_account = load_name
	print(load_name)
	account_device = 0
	
	for value in string.gmatch(saved_account, "[^_]+")
	do
		account_device = value
		break
	end
	
	print(account_device)
	if target_port == nil
	then
		MessageBox("블루스택 ADB 연결을 확인해주세요.")
		return 0
	end
	
	
	if target_port ~= account_device
	then
		print("주의! 현재 ADB 포트와 이전 ADB 포트가 다릅니다.\n복원이 안되었다면 이전에 데이터를 저장한 세션이 맞는지 확인해보세요.")
	end	
	
	
	-- 앱 종료

	headCmd = "cd ADB && "
	adbCmd = "adb -s "..device_name.." shell /system/xbin/bstk/su -c am force-stop com.kakaogames.umamusume"
	appCmd = headCmd..adbCmd

	local f = io.popen(appCmd)
	f:close()
	
	-- 현재 게스트 삭제
	
	print(device_name)
	headCmd = "cd ADB && "
	adbCmd = "adb -s "..device_name.." shell /system/xbin/bstk/su -c rm -rf /data/data/com.kakaogames.umamusume/shared_prefs"
	appCmd = headCmd..adbCmd
	
	local f = io.popen(appCmd)
	f:close()

	-- 저장된 게스트 복사
	
	headCmd = "cd ADB && "
	adbCmd = "adb -s "..device_name.." shell /system/xbin/bstk/su -c cp -a -f /data/data/com.kakaogames.umamusume/account/"..saved_account.." /data/data/com.kakaogames.umamusume/shared_prefs"
	appCmd = headCmd..adbCmd
	
	local f = io.popen(appCmd)
	f:close()
	
	Stop()
	MessageBox("게스트 계정 복구를 시도했습니다. 앱을 켜서 확인해주세요.\n복구가 안됐을 경우 디바이스 확인바람.")
end


function radio_mainrule(radio_id)
	
	MAIN_FLAG = tonumber(_mainrule)
	print(MAIN_FLAG)
	
end


function radio_alarm(radio_id)
	
	ALARM_FLAG = tonumber(_alarm)
	print(ALARM_FLAG)
	
end


function button_stop(button_id)
	
	Stop()
	SAFELOCK = 0
	GUI_enable(true)
	
end


function combo_mustSelect_name(combo_id)
	
	for k, v in pairs(LIST[STR_MUSTFIND_LIST])
	do
		if LIST[STR_MUSTFIND_LIST][k][STR_NAME_ID] == combo_id
		then
			local v = STR_VAR_MUSTFIND..'name'..tostring(k)
			LIST[STR_MUSTFIND_LIST][k][STR_NAME] = _G[v]
			break
		end
	end
end


function combo_mustSelect_num(combo_id)

	for k, v in pairs(LIST[STR_MUSTFIND_LIST])
	do
		if LIST[STR_MUSTFIND_LIST][k][STR_NUM_ID] == combo_id
		then
			local v = STR_VAR_MUSTFIND..'num'..tostring(k)
			LIST[STR_MUSTFIND_LIST][k][STR_NUM] = _G[v]
			break
		end
	end
end


function combo_select_name(combo_id)
	
	for k, v in pairs(LIST[STR_SELECTFIND_LIST])
	do
		if LIST[STR_SELECTFIND_LIST][k][STR_NAME_ID] == combo_id
		then
			local v = STR_VAR_SELECTFIND..'name'..tostring(k)
			LIST[STR_SELECTFIND_LIST][k][STR_NAME] = _G[v]
			break
		end
	end
end


function combo_select_num(combo_id)


	for k, v in pairs(LIST[STR_SELECTFIND_LIST])
	do
		if LIST[STR_SELECTFIND_LIST][k][STR_NUM_ID] == combo_id
		then
			local v = STR_VAR_SELECTFIND..'num'..tostring(k)
			LIST[STR_SELECTFIND_LIST][k][STR_NUM] = _G[v]
			break
		end
	end

end


function button_confirm(button_id)
	
	IS_OK = true
	

	if tonumber(SCOREGOAL) == nil
	then
		message = '목표점수 확인필요(정수만 허용)'
		MessageBox(message)
		IS_OK = false
	end
	
	for k, v in pairs(LIST[STR_SCOREFIND_LIST])
	do
		if (LIST[STR_SCOREFIND_LIST][k][STR_NUM] == nil) or (LIST[STR_SCOREFIND_LIST][k][STR_NUM] == '')
		then
			GUIItemUpdate(LIST[STR_SCOREFIND_LIST][k][STR_NUM_ID], '0')
			LIST[STR_SCOREFIND_LIST][k][STR_NUM] = '0'
		end
		
		if(tonumber(LIST[STR_SCOREFIND_LIST][k][STR_NUM])) ~= nil
		then
			if math.floor(tonumber(LIST[STR_SCOREFIND_LIST][k][STR_NUM])) ~= tonumber(LIST[STR_SCOREFIND_LIST][k][STR_NUM]) then 
				IS_OK = false
			end
		else
			message = tostring(k)..'번째 점수값 확인필요(정수만 허용)'
			MessageBox(message)
			IS_OK = false
		end

	end
	
	if IS_OK == true then 
		LIST_enable(STR_SCOREFIND_LIST,false)
	else
		LIST_enable(STR_SCOREFIND_LIST,true)
	end
	
	GUIUpdate()
	GUISetCurTab('점수')
	
end


function button_edit(button_id)
	if (IsStop() == '1' or IsStop() == 1)
	then
		LIST_enable(STR_SCOREFIND_LIST, true)
		IS_OK = false
	else
		LIST_enable(STR_SCOREFIND_LIST, false)
	end
	

end


function combo_score_name(combo_id)
	for k, v in pairs(LIST[STR_SCOREFIND_LIST])
	do
		if LIST[STR_SCOREFIND_LIST][k][STR_NAME_ID] == combo_id
		then
			local v = STR_VAR_SCOREFIND..'name'..tostring(k)
			LIST[STR_SCOREFIND_LIST][k][STR_NAME] = _G[v]
			break
		end
	end
end


function edit_score_num(edit_id)

	for k, v in pairs(LIST[STR_SCOREFIND_LIST])
	do
		if LIST[STR_SCOREFIND_LIST][k][STR_NUM_ID] == edit_id
		then
			local v = STR_VAR_SCOREFIND..'num'..tostring(k)
			LIST[STR_SCOREFIND_LIST][k][STR_NUM] = _G[v]
			break
		end
	end