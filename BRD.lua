
--Colonnello

-- loads gear from Moogle
include('organizer-lib')

function file_unload()
	send_command('unbind f11')
	send_command('unbind f12')
end

function get_sets()

	-- Modes is the include for a mode-tracking variable class.  Used for state vars, below.
    include('Modes')
    -- Load and initialize the include file.
	include('Mote-TreasureHunter')

	EnfeebleSong = S{
	'Foe Requiem',
	'Foe Requiem II',
	'Foe Requiem III',
	'Foe Requiem IV',
	'Foe Requiem V',
	'Foe Requiem VI',
	'Foe Requiem VII',
	'Battlefield Elegy', 
	'Carnage Elegy', 
	'Fire Threnody', 
	'Ice Threnody', 
	'Wind Threnody', 
	'Earth Threnody', 
	'Ltng. Threnody', 
	'Water Threnody', 
	'Light Threnody',
	'Dark Threnody',
	'Fire Threnody II', 
	'Ice Threnody II', 
	'Wind Threnody II', 
	'Earth Threnody II', 
	'Ltng. Threnody II', 
	'Water Threnody II', 
	'Light Threnody II',
	'Dark Threnody II',
	'Magic Finale', 
	'Pining Nocturne'}

	SleepSongs = S{
	'Foe Lullaby',
	'Foe Lullaby II',
	'Horde Lullaby',
	'Horde Lullaby II',
	}

	-- Used for Lock Style
	sets.Fashion = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		sub="Genbu's Shield",
		head="Fili Calot +1",
		body="Inyanga Jubbah +2",
		hands="Fili Manchettes +1",
		legs="Inyanga Shalwar +2",
		feet={ name="Bihu Slippers", augments={'Enhances "Nightingale" effect',}},
	}
	-- Single mode righit now (hybrid -DT/Refresh)
	sets.Idle = {
		main="Earth Staff",
		sub="Enki Strap",
		head="Aya. Zucchetto +2",
		body="Vanya Robe",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Fili Cothurnes +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Insomnia Earring",
		right_ear="Genmei Earring",
		left_ring="Stikini Ring +1",
		right_ring="Fortified Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
    }
	sets.Precast = {}
	-- Used to account for -Song Casting Time vs Fast Cast
	sets.Precast.Songs = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}}, --7
		sub="Genbu's Shield",
		head="Fili Calot +1", --14
		body="Inyanga Jubbah +2", --14
		hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}}, --6
		legs="Aya. Cosciales +2", --6
		feet={ name="Telchine Pigaches", augments={'Song spellcasting time -6%',}}, --12
		neck="Voltsurge Torque", --4
		waist="Witful Belt", --3
		left_ear="Loquac. Earring", --2
		right_ear="Genmei Earring",
		left_ring="Stikini Ring +1",
		right_ring="Kishar Ring", --4
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}, --10
	}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}}, --7
		sub="Genbu's Shield",
		head="Fili Calot +1",
		body="Inyanga Jubbah +2", --14
		hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}}, --6
		legs="Aya. Cosciales +2", --6
		feet={ name="Telchine Pigaches", augments={'Song spellcasting time -6%',}},
		neck="Voltsurge Torque", --4
		waist="Witful Belt", --3
		left_ear="Loquac. Earring", --2
		right_ear="Genmei Earring",
		left_ring="Stikini Ring +1",
		right_ring="Kishar Ring", --4
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}, --10
	}
	-- Used to force song override (low duration dummy songs)
	sets.Precast.DummySongs = {
		main="Qutrub Knife",
		sub="Genbu's Shield",
		head="Fili Calot +1",
		body="Inyanga Jubbah +2",
		hands="Fili Manchettes +1",
		legs="Fili Rhingrave +1",
		feet={ name="Telchine Pigaches", augments={'Song spellcasting time -6%',}},
		neck="Voltsurge Torque",
		waist="Flume Belt +1",
		left_ear="Genmei Earring",
		right_ear="Loquac. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Fortified Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}
	-- Default song duration / strength
	sets.Midcast = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		head="Fili Calot +1",
		body="Fili Hongreline +1",
		hands="Fili Manchettes +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +2",
		neck="Mnbw. Whistle +1",
		waist="Flume Belt +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	-- Cure Set
	sets.Midcast.Cure = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		sub="Genbu's Shield",
		range="Daurdabla",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		body={ name="Vanya Robe", augments={'HP+50','MP+50','"Refresh"+2',}},
		hands={ name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		neck="Voltsurge Torque",
		waist="Luminary Sash",
		left_ear="Handler's Earring +1",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {

	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		sub="Genbu's Shield",
		range="Gjallarhorn",
		head="Aya. Zucchetto +2",
		body="Inyanga Jubbah +2",
		hands="Aya. Manopolas +2",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +2",
		neck="Mnbw. Whistle +1",
		waist="Luminary Sash",
		left_ear="Hermetic Earring",
		right_ear="Loquac. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Kishar Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}
	-- Specific gear for spells
	sets.Midcast.Stoneskin = {
		waist="Siegel Sash",
	}
	sets.Midcast.Refresh = {}
	sets.Midcast.Nuke = {}

	-- Bard Sets
	sets.Midcast.Lullaby ={}
	sets.Midcast.Finale = {}
	sets.Midcast.Requiem = {}
	sets.Midcast.Elegy = {}
	sets.Midcast.Prelude = {}
	sets.Midcast.Madrigal = {head="Fili Calot +1"}
    sets.Midcast.Minuet = {body="Fili Hongreline +1"}
    sets.Midcast.March = {hands="Fili Manchettes +1"}
    sets.Midcast.Ballad = {legs="Fili Rhingrave +1"}
    sets.Midcast.Scherzo = {feet="Fili Cothurnes +1"}
    sets.Midcast.Mazurka = {}
    sets.Midcast.Paeon = {}
    sets.Midcast.Threnody = {}
    sets.Midcast.Minne = {}
    sets.Midcast.Mambo = {}
    sets.Midcast.Carol = {}
    sets.Midcast.Etude = {}

	sets.JA = {}
	sets.JA["Nightingale"] = {feet={ name="Bihu Slippers", augments={'Enhances "Nightingale" effect',}}}
	sets.JA["Troubadour"] = {body={ name="Bihu Justaucorps", augments={'Enhances "Troubadour" effect',}}}
	sets.JA["Soul Voice"] = {}
	sets.JA["Tenuto"] = {}
	sets.JA["Marcato"] = {}
	sets.JA["Clarion"] = {}
	sets.JA["Pianissimo"] = {}

	sets.TP = {

	}
	sets.TP.DW = {}
	sets.TP.DT = {}
	sets.TP.ACC = {}
	sets.TP.PDT = {}
	sets.TP.MDT = {}

	sets.WS = {}
	sets.WSD = {}
	sets.WS["Savage Blade"] = sets.WSD
	sets.WS["Mordant Rime"] = {}
	sets.WS["Mercy Stroke"] = {}

	sets.TreasureHunter = {
	    head="Wh. Rarab Cap +1",
	}

	organizer_items  = {		
		item1 = "Echo Drops",
		item2 = "Remedy",
		item3 = "Holy Water",
	}	
end

function pretarget(spell,action)
	if not buffactive['Muddle'] then
		-- Auto Remedy --
		if spell.action_type == 'Magic' or spell.type == 'JobAbility' then
			if buffactive['Paralysis'] then
				cancel_spell()
				send_command('input /item "Remedy" <me>')
			end
		end
		-- Auto Echo Drop --
		if spell.action_type == 'Magic' and buffactive['Silence'] then
			cancel_spell()
			send_command('input /item "Echo Drops" <me>')
		end
	end
	if spell.type == 'BardSong' then
		-- casting a buff song while engaged
		if spell.target.type == 'MONSTER' then
			if EnfeebleSong:contains(spell.english) or SleepSongs:contains(spell.english) then
				-- spell for enemey with enemy selected
			else
				change_target('<me>')
				--windower.add_to_chat(8, 'Target incorrect - redirecting to self.')
			end
		else
			if spell.target.type ==  null then
						windower.add_to_chat(8,'JA not set')
				--windower.add_to_chat(8, 'No target selected - redirecting to self.')
				change_target('<me>')
			end
		end
	end
end

function precast(spell)

	equipSet = {}
	if spell.type == 'WeaponSkill' then
		equipSet = sets.WS
		if equipSet[spell.english] then
			windower.add_to_chat(8, '['..spell.english..'] Set')
			equipSet = equipSet[spell.english]
		else
			windower.add_to_chat(8,'WS not set')
		end
    elseif spell.type == 'Ninjutsu' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'JobAbility' then
		equipSet = sets.JA
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
			windower.add_to_chat(8, '['..spell.english..'] Set')
		else
			windower.add_to_chat(8,'JA not set')
		end
	elseif spell.type == 'WhiteMagic' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'BlackMagic' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'SummonerPact' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'BardSong' then
		if not buffactive['Nightingale'] then
			-- Normal Fast Cast Songs - need to equip ranged before casting
			if spell.name == "Knight's Minne" or spell.name == "Knight's Minne II" or spell.name == "Army's Paeon" or spell.name == "Army's Paeon II" then
				equipSet = set_combine(sets.Precast.Songs, {range="Daurdabla"})
			elseif spell.name == "Honor March" then
				equipSet = set_combine(sets.Precast.Songs, {range="Marsyas"})
			elseif spell.name:contains('Horde') then
				equipSet = set_combine(sets.Precast.Songs, {range="Daurdabla"})
			else
				equipSet = set_combine(sets.Precast.Songs, {range="Gjallarhorn"})
			end
		else 
			-- NiTro Songs
			windower.add_to_chat(8,'Nitro Mode')
			if spell.name == "Knight's Minne" or spell.name == "Knight's Minne II" or spell.name == "Army's Paeon" or spell.name == "Army's Paeon II" then
				windower.add_to_chat(8, '['..spell.english..'] Set (Song Count / Daurdabla)')
				equipSet = set_combine(sets.Precast.DummySongs, {range="Daurdabla"})
			elseif spell.name == "Honor March" then
				windower.add_to_chat(8, '['..spell.english..'] Set (Special / Marsyas)')
				equipSet = set_combine(sets.Midcast, {range="Marsyas"})
			-- AOE sleep so equip Harp for max Range
			elseif spell.name:contains('Horde') then
				windower.add_to_chat(8, '['..spell.english..'] Set (AOE Sleep / Daurdabla)')
				equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), {range="Daurdabla"})
			-- Normal Enfeebles
			elseif EnfeebleSong:contains(spell.english) then
				windower.add_to_chat(8, '['..spell.english..'] Set (Enfeebling / Gjallarhorn)')
				equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), {range="Gjallarhorn"})
			else
				-- Augment the buff songs
				windower.add_to_chat(8, '['..spell.english..'] Set (Buff / Gjallarhorn)')
				equipSet = set_combine(sets.Midcast, equip_song_gear(spell), {range="Gjallarhorn"})
			end
		end
	elseif spell.type == 'BlueMagic' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'Geomancy' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'Trust' then
		equipSet = sets.Precast.FastCast
	end
	-- Equip the built set
	equip(equipSet)
 end
 
 function midcast(spell)
 	equipSet = {}
	if spell.type == 'WhiteMagic' then
		if spell.name == 'Stoneskin' then
			if buffactive['Stoneskin'] then
	  	 		windower.add_to_chat(8,'Cancel Stoneskin')
				send_command('wait 3;cancel Stoneskin')
			end
			windower.add_to_chat(8,'Stoneskin Set')
			equipSet = sets.Midcast.Stoneskin
		elseif spell.name:contains('Cure') or spell.name:contains('Cura') then
			windower.add_to_chat(8,'Cure Set')
			equipSet = sets.Midcast.Cure
		elseif spell.skill == 'Enhancing Magic' then
			if spell.name:contains('Refresh') then
				windower.add_to_chat(8,'Refresh Set')
				equipSet = set_combine(sets.Midcast.Enhancing, sets.Midcast.Refresh)
			else
				windower.add_to_chat(8,'Enhancing Magic Set')
				equipSet = sets.Midcast.Enhancing
			end
		elseif spell.skill == 'Enfeebling Magic' then
			windower.add_to_chat(8,'Enfeebling Magic Set')
			equipSet = sets.Midcast.Enfeebling
		end
	elseif spell.type == 'BlackMagic' then
		if spell.skill == 'Enfeebling Magic' then
			windower.add_to_chat(8,'Enfeebling Magic Set')
			equipSet = sets.Midcast.Enfeebling
		elseif spell.skill == 'Enhancing Magic' then
			windower.add_to_chat(8,'Enhancing Magic Set')
			equipSet = sets.Midcast.Enhancing
		else
			windower.add_to_chat(8,'Nuke Set')
			equipSet = sets.Midcast.Nuke
		end
	elseif spell.type == 'BardSong' and not buffactive['Nightingale'] then
		if spell.name == "Knight's Minne" or spell.name == "Knight's Minne II" or spell.name == "Army's Paeon" or spell.name == "Army's Paeon II" then
			windower.add_to_chat(8, '['..spell.english..'] Set (Song Count / Daurdabla)')
			equipSet = set_combine(sets.Precast.DummySongs, {range="Daurdabla"})
		elseif spell.name == "Honor March" then
			windower.add_to_chat(8, '['..spell.english..'] Set (Special / Marsyas)')
			equipSet = set_combine(sets.Midcast, {range="Marsyas"})
		-- AOE sleep so equip Harp for max Range
		elseif spell.name:contains('Horde') then
			if state.TreasureMode.value == 'None' then
				windower.add_to_chat(8, '['..spell.english..'] Set (AOE Sleep / Daurdabla)')
				equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), {range="Daurdabla"})
			else
				windower.add_to_chat(8, '['..spell.english..'] Set (AOE Sleep / Daurdabla) with Treasure Hunter')
				equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), sets.TreasureHunter, {range="Daurdabla"})
			end
		-- Normal Enfeebles
		elseif EnfeebleSong:contains(spell.english) then
			windower.add_to_chat(8, '['..spell.english..'] Set (Enfeebling / Gjallarhorn)')
			equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), {range="Gjallarhorn"})
		else
			-- Augment the buff songs
			windower.add_to_chat(8, '['..spell.english..'] Set (Buff / Gjallarhorn)')
			equipSet = set_combine(sets.Midcast, equip_song_gear(spell), {range="Gjallarhorn"})
		end
	end
	-- Equip the built set
	equip(equipSet)
end
 
 -- after our ws or ability, call the choose_set function
 -- to put on the correct gear.
 function aftercast(spell)
     choose_set()  
end

-- Used to determine state after casting
function choose_set()
	if player.status == "Engaged" then
		if 	state.TreasureMode.value == 'None' then
			equip(sets.TP)
		else
			equip(sets.TreasureHunter)
		end
    else
		equip(sets.Idle)
	end
end

function buff_change(name,gain)
	-- Useful hook to automate buffing
end

function equip_song_gear(spell)
	equipSet = {}
	if spell.target.type == 'MONSTER' then
		if string.find(spell.english,'Finale') then equipSet = sets.Midcast.Finale end
		if string.find(spell.english,'Lullaby') then equipSet = sets.Midcast.Lullaby end
		if string.find(spell.english,'Threnody') then equipSet = sets.Midcast.Threnody end
		if string.find(spell.english,'Elegy') then equipSet = sets.Midcast.Elegy end
		if string.find(spell.english,'Requiem') then equipSet = sets.Midcast.Requiem end
	else
		if string.find(spell.english,'March') then equipSet = sets.Midcast.March end
		if string.find(spell.english,'Minuet') then equipSet = sets.Midcast.Minuet end
		if string.find(spell.english,'Madrigal') then equipSet = sets.Midcast.Madrigal end
		if string.find(spell.english,'Ballad') then equipSet = sets.Midcast.Ballad end
		if string.find(spell.english,'Scherzo') then equipSet = sets.Midcast.Scherzo end
		if string.find(spell.english,'Mazurka') then equipSet = sets.Midcast.Mazurka end
		if string.find(spell.english,'Paeon') then equipSet = sets.Midcast.Paeon end
		if string.find(spell.english,'Carol') then equipSet = sets.Midcast.Carol end
		if string.find(spell.english,'Minne') then equipSet = sets.Midcast.Minne end
		if string.find(spell.english,'Mambo') then equipSet = sets.Midcast.Mambo end
		if string.find(spell.english,'Etude') then equipSet = sets.Midcast.Etude end
		if string.find(spell.english,'Prelude') then equipSet = sets.Midcast.Prelude end
	end
	return equipSet
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip(sets.Idle)
    elseif new == 'Engaged' then
        equip(sets.TP)
    end
end

function dummy_songs ()
	windower.add_to_chat(8,'Song Buff Begin')
	if buffactive['Nightingale'] then
		send_command("input /ma \"Knight's Minne II\" <me>;wait 2;input /ma \"Knight's Minne\" <me>")
	else
		send_command("input /ma \"Knight's Minne II\" <me>;wait 5;input /ma \"Knight's Minne\" <me>")
	end
end

function self_command(command)
    if command == 'Buff' then
		dummy_songs()
	elseif command == 'update auto' then
		if player.status == Engaged then
			windower.add_to_chat(8,'Treasure Hunter Tagged')
		end
       choose_set()
	elseif command == "TreasureHunter" then
		if 	state.TreasureMode.value == 'Tag' then
		    state.TreasureMode:set('None')
		else
			 state.TreasureMode:set('Tag')
		end
		choose_set()
		windower.add_to_chat(8,'Treasure Hunter Mode: ['..state.TreasureMode.value..']')
	end
end

 -- Puts on our fashion set, lockstyle it, then switch to our idle set.
 send_command('wait 5;input /lockstyle off;gs equip Fashion;wait 10;input /lockstyle on;wait 1;gs equip Idle;input /macro book 12;input /echo Change Complete')
 send_command('bind f12 gs c Buff')
 send_command('bind f11 gs c TreasureHunter')