err = Loopstep("doNotPick", "exitGacha", LOOP_ERR_SMALL, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("exitGacha", "toHome", LOOP_ERR_LARGE, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("toHome", "toMenu", LOOP_ERR_LARGE, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("toMenu", "toRecord", LOOP_ERR_LARGE, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("toRecord", "skipRecord", LOOP_ERR_LARGE, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("skipRecord", "closeRecord", LOOP_ERR_LARGE, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("closeRecord", "closeReward", LOOP_ERR_LARGE, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("closeReward", "exitRecord", LOOP_ERR_LARGE, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("exitRecord", "closeMenu", LOOP_ERR_LARGE, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("closeMenu", "giftBox", LOOP_ERR_LARGE, {true, 0,0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("giftBox", "getAll", LOOP_ERR_LARGE, {true, 0, 0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("getAll", "noGift", LOOP_ERR_LARGE, {true, 0, 0})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("noGift", "goGacha", LOOP_ERR_LARGE, {true, 113, 656})
if ErrorJudge(err) > 0 then return 0 end

err = Loopstep("goGacha", "gachaStandby", LOOP_ERR_LARGE, {true, 0, 0})
if ErrorJudge(err) > 0 then return 0 end