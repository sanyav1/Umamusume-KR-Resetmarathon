Sleep(2000)

if ERR_NETWORK == 1 then
	Mouse(LBUTTON, CLICK, 135, 461, 135, 461, 0, 0, 0.5, 1, FASTER, MESSAGE)
	Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTER, MESSAGE)

	err = Loopstep("loginBanner", "syncAccount", LOOP_ERR_LARGE, {true, 198, 626})
	ErrorJudge(err)

	ERR_NETWORK = 0
end

err = Loopstep("umaBanner", "afterBanner", LOOP_ERR_LARGE, {true, 204, 622})
if ErrorJudge(err) > 0 then return 0 end

EnableImage(true, "gameStart")
EnableImage(false, "errorCallback")

GotoImage("startScript2")