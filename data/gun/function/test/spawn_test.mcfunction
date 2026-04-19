# === 枪弹伤害 & 防弹保护附魔 测试 ===
# 在玩家面前召唤两个僵尸对照组，各100HP，均穿全套钻石甲
# 左边：无附魔（对照组）
# 右边：全身防弹保护IV（实验组）
# 射击后观察伤害数字差异即可确认附魔生效

# 清除附近已有的测试僵尸
kill @e[type=zombie,name="普通僵尸",distance=..20]
kill @e[type=zombie,name="防弹僵尸",distance=..20]

# 对照组：全套钻石甲，无附魔，100HP
summon zombie ^ ^0 ^4 {\
    CustomName:{text:"普通僵尸",color:"red"},\
    CustomNameVisible:1b,\
    NoAI:1b,\
    PersistenceRequired:1b,\
    attributes:[{id:"minecraft:max_health",base:100.0d}],\
    Health:100.0f,\
    equipment:{\
        head:{id:"minecraft:diamond_helmet",count:1},\
        chest:{id:"minecraft:diamond_chestplate",count:1},\
        legs:{id:"minecraft:diamond_leggings",count:1},\
        feet:{id:"minecraft:diamond_boots",count:1}\
    },\
    drop_chances:{head:0.0f,chest:0.0f,legs:0.0f,feet:0.0f}\
}

# 实验组：全套钻石甲 + 防弹保护IV，100HP
summon zombie ^3 ^0 ^4 {\
    CustomName:{text:"防弹僵尸",color:"green"},\
    CustomNameVisible:1b,\
    NoAI:1b,\
    PersistenceRequired:1b,\
    attributes:[{id:"minecraft:max_health",base:100.0d}],\
    Health:100.0f,\
    equipment:{\
        head:{id:"minecraft:diamond_helmet",count:1,components:{"minecraft:enchantments":{"gun:bullet_protection":4}}},\
        chest:{id:"minecraft:diamond_chestplate",count:1,components:{"minecraft:enchantments":{"gun:bullet_protection":4}}},\
        legs:{id:"minecraft:diamond_leggings",count:1,components:{"minecraft:enchantments":{"gun:bullet_protection":4}}},\
        feet:{id:"minecraft:diamond_boots",count:1,components:{"minecraft:enchantments":{"gun:bullet_protection":4}}}\
    },\
    drop_chances:{head:0.0f,chest:0.0f,legs:0.0f,feet:0.0f}\
}

tellraw @s [{text:"已召唤测试僵尸！",color:"gold"},{text:"\n左边: ",color:"white"},{text:"普通僵尸",color:"red"},{text:" (钻石甲, 无附魔, 100HP)",color:"gray"},{text:"\n右边: ",color:"white"},{text:"防弹僵尸",color:"green"},{text:" (钻石甲, 防弹IV×4, 100HP)",color:"gray"},{text:"\n请射击两者对比伤害数字！",color:"yellow"}]
