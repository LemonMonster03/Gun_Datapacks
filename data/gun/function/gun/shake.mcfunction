scoreboard players add @a[scores={gun_shake_gap=1..}] gun_shake_gap 1 
scoreboard players set @a[scores={gun_shake_gap=10..}] gun_shake_gap 0

execute as @e[type=player,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] at @s if score @s gun_shake_up < @s gun_shake run tp @s ~ ~ ~ ~ ~-1.5
execute as @e[type=player,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] at @s if score @s gun_shake_up < @s gun_shake run scoreboard players add @s gun_shake_up 2

execute as @e[type=player,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},scores={gun_shake_gap=0}] at @s if score @s gun_shake_up >= @s gun_shake if score @s gun_shake_down < @s gun_shake run tp @s ~ ~ ~ ~ ~1.5
execute as @e[type=player,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},scores={gun_shake_gap=0}] at @s if score @s gun_shake_up >= @s gun_shake if score @s gun_shake_down < @s gun_shake run scoreboard players add @s gun_shake_down 2

execute as @e[type=player,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] at @s if score @s gun_shake_down >= @s gun_shake run scoreboard players set @s gun_shake 0
execute as @e[type=player,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] at @s if score @s gun_shake_down >= @s gun_shake run scoreboard players set @s gun_shake_down 0 
execute as @e[type=player,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] at @s if score @s gun_shake_down >= @s gun_shake run scoreboard players set @s gun_shake_up 0 
