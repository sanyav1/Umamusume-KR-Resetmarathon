Sleep(1000)

if ERR_NETWORK == 1 then
	Mouse(LBUTTON, CLICK, 196, 463, 196, 463, 0, 0, 0.5, 1, FASTER, MESSAGE)
	Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTER, MESSAGE)

	err = loopstep("loginBanner", "syncAccount", LOOP_ERR_LARGE, {true, 198, 626})
	err_judge(err)

	ERR_NETWORK = 0
end

EnableImage(true, "gameStart")
EnableImage(false, "errorCallback")

Sleep(1000)
GotoImage("loginTap")