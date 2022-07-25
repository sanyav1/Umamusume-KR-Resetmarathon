Sleep(1000)

-- Input trainer info
Mouse(LBUTTON, CLICK, 123, 322, 123, 322, 0, 0, 0.3, 1, FASTER, MESSAGE)
Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTER, MESSAGE)
Keybd('KITASAN<Enter>', FASTER, MESSAGE)
Mouse(LBUTTON, CLICK, 198, 461, 198, 461, 0, 0, 0.3, 1, FASTER, MESSAGE)
Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTER, MESSAGE)

err = Loopstep("trainerOK", "skipGift", LOOP_ERR_LARGE, {true, 0, 0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("skipGift", "notifications", LOOP_ERR_LARGE*2, {true, 0, 0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("notifications", "mainStory", LOOP_ERR_LARGE, {true, 374,25})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("mainStory", "umaStory", LOOP_ERR_LARGE, {true, 202,464})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("umaStory", "giftBox", LOOP_ERR_LARGE, {true, 201,658})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("giftBox", "getAll", LOOP_ERR_LARGE, {true, 0, 0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("getAll", "getOK", LOOP_ERR_LARGE, {true, 0, 0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("getOK", "noGift", LOOP_ERR_LARGE, {true, 201, 658})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("noGift", "goGacha", LOOP_ERR_LARGE, {true, 113, 656})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("goGacha", "gachaStandby", LOOP_ERR_LARGE, {true, 0, 0})
if ErrorJudge(err) > 0 then return 0 end