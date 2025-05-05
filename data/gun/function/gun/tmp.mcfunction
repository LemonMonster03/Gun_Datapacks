execute if entity @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:gunpowder"}]}] run clear @s minecraft:gunpowder 1


execute as @e[type=player,nbt={Inventory:[{id:"minecraft:gunpowder"}]}] at @s store result storage gundatapack gun_ammo.piston int 1 \
run data get entity @s Inventory[{id:"minecraft:gunpowder"}].count


data get storage minecraft:gundatapack gun_ammo.piston