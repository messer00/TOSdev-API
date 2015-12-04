return {
  getHp = function()
    return info.GetStat(session.GetTargetHandle()).HP;
  end,

  getHPMax = function()
    return info.GetStat(session.GetTargetHandle()).MaxHP;
  end,

  getSP = function()
    return info.GetStat(session.GetTargetHandle()).SP;
  end,

  getSPMax = function()
    return info.GetStat(session.GetTargetHandle()).MaxSP;
  end,

  getLevel = function()
    return info.GetTargetInfo(session.GetTargetHandle()).level;
  end,

  getName = function()
    return info.GetTargetInfo(session.GetTargetHandle()).name;
  end,

  isPlayer = function()
  end,

  isMonster = function()
  end
  
}
