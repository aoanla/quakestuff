/*  Copyright (C) aoanla 2022 

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

    See file, 'COPYING', for details.
*/


//logic here based on the Robert Field fixed trigger_hurt [with additional refactory period for Gremlins to let them do stuff between forced spawns] + hipnotic count triggers
void() trigger_grem_split_touch = 
{
    if (self.hurt_nextthink == -1) 
        return; //disabled currently
    if (time != self.hurt_together_time) 
        if (time < self.hurt_nextthink) 
            return; //refactory period for trigger

    if (other.classname == "monster_gremlin") //or whatever
    {
        if ( other.deadflag != DEAD_NO ) return; 
        if ( other.hurt_nextthink > time ) return; //refactory period for dups

        //as in fixed trigger_hurt
        self.hurt_together_time = time;
        self.hurt_nextthink = time + 1; //trigger 1/sec at most

        other.hurt_nextthink = time + 5; //dup every 5 seconds - inherited by the split gremlin, so prevents (hopefully) weird invulnerable zombie grems, also rate-limits total gremlin apocalypse   
        //NO THINK VERSION
        local entity oldself = self;
        self = other;
        Gremlin_Split();
        self = oldself;

    //AOANLA from hipnotic hurt trigger MED 12/01/96 added count stuff
      if (self.cnt > 0)
         {
         self.cnt = self.cnt - 1;
         if (self.cnt == 0)
            {
            self.touch = SUB_Null;
            self.nextthink = time + 0.1;
            self.think = SUB_Remove;
            }
         }
    }
}

void() trigger_grem_split_use = {
    //(dis/en)abled by triggering
    if (self.hurt_nextthink < 0) //disabled currently
        self.hurt_nextthink = time + 1; //enabled
    else  //enabled currently
        self.hurt_nextthink = -1;
}

//AOANLA 17/04/22 
/* QUAKED trigger_grem_split (.5 .5 .5) ? START_OFF
Gremlins that touch this will immediately [in the next 0.1 sec] split as if completing a gorge action
    If this has a targetname, it can be toggled on by being fired, disabled by triggering again
    spawnflags 1 sets it to start off [else starts on]
*/
void() trigger_grem_split = 
{
    InitTrigger();
    if (self.spawnflags && 1)
        self.hurt_nextthink = -1; 
    else
        self.hurt_nextthink = time + 0.2; //pause before doing stuff to let gremlin spawns sort out, otherwise you get weird invincible gremlins spawned from gremlins in trigger at worldspawn
    self.touch = trigger_grem_split_touch;

//AOANLA from hipnotic hurt trigger MED 12/01/96 added count stuff. zero or -1 is "infinite uses"
   if (self.cnt == 0)
      self.cnt = -1;


}
