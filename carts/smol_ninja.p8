pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- smol ninja by Imabearlol

-- player table
player = {}
player.x = 20
player.y = 60
player.speed = 3
player.facing = "left"
player.sprite = 0
player.max_sprite = 2
player.moving = false

-- player high-level functions
function player_update()
  player_pre_input()
  if btn(0) then
    player_process_input("left")
  end
  if btn(1) then
    player_process_input("right")
  end
  player_post_input()
end

function player_draw()
  spr(player_sprite(), player_x(), player_y())
end

-- player low-level functions
function player_pre_input()
  player.moving = false
end  

function player_process_input(input_str)
  player.moving = true
  if input_str == "left" then
    player.x -= player.speed
    player.facing = "left"
  end
  if input_str == "right" then
    player.x += player.speed
    player.facing = "right"
  end
  player.sprite += 1
  if player.sprite == player.max_sprite then
    player.sprite = 0
  end
end

function player_post_input()
  if not player.moving then
    player.sprite = 0
  end
end

function player_sprite()
  if player.facing == "left" then
    return player.sprite
  elseif player.facing == "right" then
    return player.sprite + player.max_sprite
  end
end

function player_x()
  return player.x
end

function player_y()
  return player.y
end

-- callbacks
function _update()
  player_update()
end

function _draw()
  cls()
  player_draw()
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555500055555000055555000555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09999999099999999999999099999990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05755500057555000055575000555750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555550055555500555555005555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00055500000555000055500000555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00050500000050500505000000505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
