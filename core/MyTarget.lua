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
  end,

  isBoss = function()
    return info.GetTargetInfo(session.GetTargetHandle()).isBoss;
  end,

  isElite = function()
    return info.GetTargetInfo(session.GetTargetHandle()).isElite;
  end,

  targetWindow = function()
    return info.GetTargetInfo(session.GetTargetHandle()).targetWindow;
  end,

  getDistance = function()
    return info.GetTargetInfo(session.GetTargetHandle()).distance;
  end,

  isInveincible = function()
    return info.GetTargetInfo(session.GetTargetHandle()).isInvicible;
  end,

  getAttribute = function()
    return info.GetTargetInfo(session.GetTargetHandle()).attribute;
  end,

  getArmorType = function()
    return info.GetTargetInfo(session.GetTargetHandle()).armorType;
  end,

  getRaceType = function()
    return info.GetTargetInfo(session.GetTargetHandle()).raceType;
  end,

  getTargetSize = function()
    return info.GetTargetInfo(session.GetTargetHandle()).size;
  end,
  
  isQuestMark = function()
    return info.GetTargetInfo(session.GetTargetHandle()).isQuestMark;
  end,
  
  isSkillObj = function()
    return info.GetTargetInfo(session.GetTargetHandle()).isSkillObj;
  end,

  isDialog = function()
    return info.GetTargetInfo(session.GetTargetHandle()).isDialog;
  end
  
}
