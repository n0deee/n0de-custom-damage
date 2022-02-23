
# N0de Custom Damage

A datapack tool to cause customized damage to entities and mobs. It can take into account armor and different types of enchantments, ignore hurttime and several other options. 
## ⭐ Freatures


- Custom Damage based on armor, enchantments and resistance effect.
- Custom Heal and Set Health
- Decimal Places (on the things listed above)
- Options to cause damage
- Return Values
## ℹ️ How to Use

Please Note:
- All the scoreboard values in this datapack are in x1000 scale. i.e. 2500 equals 2.5
- All the examples here would be of a function executing `as <entity>`
### 🩸 Custom Damage:

Allows you to deal damage to any player/entity damage calculating the armor, enchantments, and resistance effect. Unfortunately, it does not take absorption into account.

**Dealing 2.23hp damage:**
```mcfunction
scoreboard players set @s ncd_damage 2230
function ncdamage:apply_changes
```
This was two quicks examples of how to do damage. You also have some **options**, such as ignoring hurttime and damage type. See the section below.


#### Scoreboard Damage Options:
```txt
# Options
ncd_bypshurttime: If it is 1 or greater, deals damage even if the player/entity is in hurttime.
ncd_bypsresef: If it is 1 or greater, deals damage without calculating the resistance effect.
ncd_damagetype: Sets the damage type (listed bellow). It is used to calculate enchantments or ignore armor.
ncd_piercing: Set value of ncd_apiercing and ncd_epiercing to ncd_piercing.
ncd_apiercing: Defines in % the armor piercing (only armor) (how much it will be ignored).
ncd_epiercing: Defines in % the enchantments piercing (enchantments only) (how much it will be ignored).

# Damage Types:
General/Any: any value or unset
Fire: 1
Explosion: 2
Projectile: 3
Fall Damage: 4
Void/Effects (bypass the armor): -1
```

Example using all options:
```mcfunction
# Deals 12.5 projectile damage ignoring the hurttime, protection enchantments and resistance effect
scoreboard players set @s ncd_damage 12500
scoreboard players set @s ncd_damagetype 3
scoreboard players set @s ncd_bypshurttime 1
scoreboard players set @s ncd_bypsenchants 1
scoreboard players set @s ncd_bypsresef 1
function ncdamage:apply_changes
```
### 💚 Custom Heal
Heal any player/entity with as much as you want.

**Healing 5hp:**
```mcfunction
scoreboard players set @s ncd_heal 5000
function ncdamage:apply_changes
```
### 💛 Set Health
Set the health of any mob/player. It ignores any defense and hurttime.

**Setting Health to 10.505hp:**
```mcfunction
scoreboard players set @s ncd_sethealth 10505
function ncdamage:apply_changes
```
### ↩️ Return Values
When you execute `function ncdamage:apply_changes`, it sets 2 scoreboards on the entity.
```txt
ncd_finaldamage: Returns the final damage caused by the system.
ncd_finalchange: Returns the difference from the previous health and the current health.
```
### Tips & More Usage Examples
Notes:
- All scores (such damage and options) are reset after apply_changes.
- The datapack does not wear out the armor.
- In vanilla, healthboost or life attributes that define the player's health for more than 1024hp bugs the datapack. Health boost level 250 is the maximum that can be set.


Deal 18.75hp ignoring any defense.

```mcfunction
scoreboard players set @s ncd_damage 18750
scoreboard players set @s ncd_damagetype -1
scoreboard players set @s ncd_bypsresef 1
function ncdamage:apply_changes
```
You can also mix damage, healing and sethp in the same application and several times per tick.
```mcfunction
scoreboard players set @s ncd_sethealth 20000
scoreboard players set @s ncd_damage 9000
scoreboard players set @s ncd_heal 1000
function ncdamage:apply_changes

scoreboard players set @s ncd_heal 2000
function ncdamage:apply_changes
```
And of course, you can set or do any operation with any of these scores by other scores.
```mcfunction
scoreboard players operation @s ncd_damage = #weapon_damage temp
scoreboard players operation @s ncd_damage *= #5 number
function ncdamage:apply_changes
```
## Technical Notes
- A player takes 1 tick to have his current health updated. In that tick, maybe any normal damage or healing (other than from the datapack) can end up being ignored, but it is irrelevant most of the time.
- The datapack tries to respect the hurttime by not doing more damage than it should, but the game does not count the datapack damage into consideration, making it possible to do more damage through normal means.
- When the player is below 1hp, it is not possible to do damage with attributes. So the player doesn't receive any real damage, but the current health is stored in the score ncd.virtualhp.
- Important Note: The resistance effect level 36 (specifically) is ignored. This is because the system uses it to not kill the player with simulated damage.