-- Assign initial prevTime
if prevTime == nil
then
	prevTime = os.time()
end

-- Reset network after given time
prevTime = resetAdress(prevTime,NETWORK_RESET_TIME,net_device)

-- Find App and touch it
err = loopstep("appIcon", "loginKakao", LOOP_ERR_LARGE*1.5, {true, 0, 0})
if err_judge(err) > 0 then return 0 end

-- Press guest login
err = loopstep("loginKakao", "loginGuest", LOOP_ERR_MEDIUM, {true, 200, 666})
if err_judge(err) > 0 then return 0 end


err = loopstep("loginGuest", "guestOk", LOOP_ERR_MEDIUM, {false, 0,0})
if err_judge(err) > 0 then return 0 end


err = loopstep("guestOk", "kakaoGames", LOOP_ERR_LARGE, {true, 0,0})
if err_judge(err) > 0 then return 0 end

-- Kakao EULA confirmation
Mouse(LBUTTON, CLICK, 27, 149, 27, 149, 0, 0, 0.3, 1, FASTER, MESSAGE)
Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTEST, MESSAGE)
Mouse(LBUTTON, CLICK, 27, 176, 24, 156, 0, 0, 0.3, 1, FASTER, MESSAGE)
Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTEST, MESSAGE)
Mouse(LBUTTON, CLICK, 27, 201, 24, 177, 0, 0, 0.3, 1, FASTER, MESSAGE)
Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTEST, MESSAGE)

Mouse(LBUTTON, CLICK, 199, 311, 199, 311, 0, 0, 0.5, 1, FASTER, MESSAGE)
Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTER, MESSAGE)

Sleep(3000)

-- Touch to start the game
Mouse(LBUTTON, CLICK, 198, 626, 198, 626, 0, 0, 0.5, 1, FASTER, MESSAGE)
Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTER, MESSAGE)

-- After EULA, Pass or Error?
err = loopstep_or("networkError", "syncAccount", LOOP_ERR_LARGE, {false, 0,0})

if err == 1 then
	-- Network error. Go to title menu
	EnableImage(true, "errorCallback")
	EnableImage(false, "gameStart")
	GotoImage("errorCallback")
	ERR_NETWORK = 1
else
	-- No error. You are go
	GotoImage("loginTap")
end