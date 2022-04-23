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

