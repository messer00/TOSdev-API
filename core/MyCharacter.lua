return {
	getHp = function()
		return info.GetStat(session.GetMyHandle()).HP;
	end

	getHpMax = function()
		return info.GetStat(session.GetMyHandle()).maxHP;
	end

	getSp = function()
		return info.GetStat(session.GetMyHandle()).SP;
	end

	getSpMax = function()
		return info.GetStat(session.GetMyHandle()).maxSP;
	end

	getStamina = function()
		return info.GetStat(session.GetMyHandle()).Stamina;
	end

	getStaminaMax = function()
		return info.GetStat(session.GetMyHandle()).MaxStamina;
	end

	getShield = function()
		return info.GetStat(session.GetMyHandle()).shield;
	end

	getShieldMax = function()
		return info.GetStat(session.GetMyHandle()).maxShield;
	end

	getSilver = function()
		return GET_TOTAL_MONEY();
	end

	getBaseLevel = function()
		return info.GetLevel(session.GetMyHandle());
	end

	getFamilyName = function()
		return info.GetFamilyName(session.GetMyHandle());
	end

	getCurrentBaseExperience = function()
		return session.GetEXP();
	end

	getRequiredBaseExperience = function()
		return session.GetMaxEXP();
	end

	getCurrentBaseExperiencePercent = function()
		return (getCurrentBaseExperience() / getRequiredBaseExperience) * 100;
	end
}