/*  Copyright (C) 2022 aoanla

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
/* new entity fields for gremlin mod
*/

//
// AOANLA entries
//

// gremlin stuff, to be rolled into worldspawn options etc
//damage needed to be done to corpse to allow gremlin to dup (default: -200)
.float      grem_dup_health; 

//probability that this gremlin will try to steal a weapon, default 0.4
.float      grem_steal_try_prob;

//probability that this gremlin will *succeed* at stealing a weapon, default 0.5
.float      grem_steal_succ_prob;

//maximum gremlins in level, ever [includes dead ones] (default 3*naturally spawned grems - so 2*natural spawn from splits + the originals)
.float      max_gremlins;

//globals

//global default for the damage a gremlin needs to do to a corpse to dup (default -200, overridden by gremlin specific value)
//float grem_dup_health; 

//global default for the likelihood a gremlin will try to steal a weapon, default 0.4, overridden by gremlin specific value
//float grem_steal_try_prob; 

//global default for the likelihood a gremlin will *succeed* at stealing a weapon, default 0.5, overriden by gremlin specific value
//float grem_steal_succ_prob;

//maximum gremlins in level at any point
//if unset, defaults to "twice number of gremlins spawned from non-splits"
//float max_gremlins;

