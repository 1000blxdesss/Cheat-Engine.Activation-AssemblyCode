function CETrainer_rPlayerInstRespClick(sender)
         local zscript=[[
         define(address, Terraria.Player::UpdateDead+553)
         define(bytes, 7D 04)

         [ENABLE]

         assert(address, bytes)

         address:
                 nop 2

         [DISABLE]

         address:
                 db bytes
         //jnl Terraria.Player::UpdateDead+549]]

         if CETrainer.rPlayerInstResp.Checked then
            local r
            discript12345=nil

            r,discript12345=autoAssemble(zscript)
            if not r then
               CETrainer.rPlayerInstResp.Checked=false
            end
            else
            if discript12345 then
               autoAssemble(zscript,discript12345)
               discript12345=nil
            end
         end
end

function CETrainer_rPlayerMobsAgroClick(sender)
 if CETrainer.rPlayerMobsAgro.Checked then
    CETrainer.AgroEf.Visible = true
    end
    local scriptAggro=[[define(address, Terraria.Player::ResetEffects+293)
define(bytes, 89 96 2C 03 00 00)

[ENABLE]

assert(address, bytes)

alloc(newmem, 1)

label(code)
label(return)
label(playerAggro)

registersymbol(playerAggro)

newmem:
code:
  fild dword ptr [playerAggro]
  fistp dword ptr [esi+32C]
  jmp return

  playerAggro:
    dd (int)0

address:
  jmp newmem
  nop
return:

[DISABLE]

address:
  db bytes
  //mov [esi+328],edx

unregistersymbol(*)
dealloc(*)]]
--local playerAggro = script:match("playerAggro:%s*dd%s*%((%w+)%)")
   -- print(string.format('%X', getAddress('playerAggro')))

   if CETrainer.rPlayerMobsAgro.Checked then
            local r
            discript12345=nil

            r,discript12345=autoAssemble(scriptAggro)
            tests = string.format('%08X', getAddress('playerAggro'))
           -- te=tonumber(tests)
           valueAggro=tonumber(CETrainer.AgroEf.Text)
            writeDouble(tests,valueAggro)

            local text = CETrainer.AgroEf.Text
            local pattern = "-"
            local valueAg

            if string.sub(text, 1, 1) == "-" then
               valueAg = text
               writeDouble(tonumber(tests), tonumber(valueAg))
             end



            if not r then
               CETrainer.rPlayerMobsAgro.Checked=false
            end
            else
            if discript12345 then
               autoAssemble(scriptAggro,discript12345)
               discript12345=nil
            end
            end
end

function CETrainer_rPlayerMinionsQuantyClick(sender)
         if CETrainer.rPlayerMinionsQuanty.Checked  then
            CETrainer_rMinionQuanty.Visible = true
         end
         local QuantyScript=[[
         define(address, Terraria.Player::ResetEffects+424)

         [ENABLE]

         assert(address, C7 86 B0 02 00 00 ** ** 00 00)

         address+6:
                   db 01

         [DISABLE]

         address+6:
                   db 01
         ]]
         if CETrainer.rPlayerMinionsQuanty.Checked then
            local d
           local originalBytes=nil
            d,originalBytes = autoAssemble(QuantyScript)
            local Minions = string.format('%08X',getAddress('Terraria.Player::ResetEffects+424+6'))
            local quanty = tonumber(CETrainer.rMinionQuanty.Text)
            writeInteger(Minions,quanty)
         if not d then
            CETrainer.rPlayerMinionsQuanty.Checked=false
            end
            else
            if originalBytes then
               autoAssemble(QuantyScript,originalBytes)
               originalBytes=nil
            end
         end


end

function CETrainer_rPlayerSentriesClick(sender)
         if CETrainer.rPlayerSentries.Checked then
            CETrainer.rSentries.Visible = true
         end
         local SentriesScr=[[
               define(address, Terraria.Player::ResetEffects+42E)

               [ENABLE]

               assert(address, C7 86 28 05 00 00 ** ** 00 00)

               address+6:
                         db 01

               [DISABLE]

               address+6:
                         db 01
         ]]
         if CETrainer.rPlayerSentries.Checked then
            local d
           local originalBytes=nil
            d,originalBytes = autoAssemble(SentriesScr)
            local Sentries = string.format('%08X',getAddress('Terraria.Player::ResetEffects+42E+6'))
            local quantySntr = tonumber(CETrainer.rSentries.Text)
            writeInteger(Sentries,quantySntr)
         if not d then
            CETrainer.rPlayerMinionsQuanty.Checked=false
            end
            else
            if originalBytes then
               autoAssemble(SentriesScr,originalBytes)
               originalBytes=nil
            end
         end

end

function CETrainer_rPlayerDamageMeleeClick(sender)
         if CETrainer.rPlayerDamageMelee.Checked then
            CETrainer.meleeDamage.Visible = true
            local scriptMelee=[[
                  define(address, Terraria.Player::ResetEffects+18B)
                  define(bytes,D9 E8 D9 9E 64 04 00 00 )

                  [ENABLE]

                  assert(address, bytes)

                  alloc(newmem, 1)

                  label(code)
                  label(return)
                  label(meleeDamage)


                  registersymbol(meleeDamage)

                  newmem:
                  code:
                    fld dword ptr [meleeDamage]
                    fstp dword ptr [esi+464]

                    jmp return

                    meleeDamage:
                      dd (float)100
                  address:
                    jmp newmem
                    nop 3
                  return:

                  [DISABLE]

                  address:
                    db bytes
                    //fld1
                    //fstp dword ptr [esi+460]

                  unregistersymbol(*)
                  dealloc(*)
                  ]]
                  local var,originalBytes=nil,nil
                  var,originalBytes=autoAssemble(scriptMelee)
                  local addressMelee,valueMelee=string.format('%08X',getAddress('meleeDamage')),CETrainer.meleeDamage.Text
                  writeFloat(addressMelee,valueMelee)
                  if not var then
                     CETrainer.meleeDamage.Checked = false
                     end
                  else
                  if originalBytes then
                     autoAssemble(scriptMelee,originalBytes)
                  end

end
end

function CETrainer_rPlayerDamageRangedClick(sender)
         if CETrainer.rPlayerDamageRanged.Checked then
            CETrainer.RangedDamage.Visible = true
         local RangedScript= [[
         define(address, Terraria.Player::ResetEffects+195)
         define(bytes, D9 9E 6C 04 00 00 )

         [ENABLE]

         assert(address, bytes)

         alloc(newmem, 1)

         label(code)
         label(return)
         label(rangedDamage)

         registersymbol(rangedDamage)

         newmem:
         code:
              fld dword ptr [rangedDamage]
              fstp dword ptr [esi+46C]

              jmp return

              rangedDamage:
              dd (float)100


              address:
              jmp newmem
              nop
         return:

         [DISABLE]

         address:
                 db bytes

         unregistersymbol(*)
         dealloc(*)
         ]]
               local var,originalBytes=nil,nil
                  var,originalBytes=autoAssemble(RangedScript)
                  local addressRanged,valueRanged=string.format('%08X',getAddress('rangedDamage')),CETrainer.RangedDamage.Text
                  writeFloat(addressRanged,valueRanged)
                  if not var then
                     CETrainer.RangedDamage.Checked = false
                     end
                  else
                  if originalBytes then
                     autoAssemble(RangedScript,originalBytes)
                  end

end
end