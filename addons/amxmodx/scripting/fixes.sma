#include <amxmodx>
#include <amxmisc>
#include <engine>
#include <hamsandwich>


//----------------------------------------------------------//
public plugin_init()
{
   register_plugin("Fixes for 1.3", "0", "YoSoyNacho"); // Plugin Information
   register_event("ResetHUD", "spawnfixes", "be");
   register_clcmd("fullupdate", "clcmd_fullupdate");
   register_clcmd("ascend", "meleefix")
   register_clcmd("descend", "meleefix")
}
//----------------------------------------------------------//
public client_disconnect(id)
{
   remove_task(id)
   return PLUGIN_HANDLED
}

public meleefix(id)
{
    client_cmd(id, "slot1")
    return PLUGIN_CONTINUE
}

public spawnfixes(id)
{
   client_cmd(id, "fov 100")
   client_cmd(id, "cam_idealdist 100")
   set_task(0.1, "switchmelee", id)

   return PLUGIN_CONTINUE
}

public switchmelee(id)
{
   new Float:SPTime = 3.9
   set_task(SPTime, "sp_off", id)
   return PLUGIN_HANDLED
}

public sp_off(id)
{
   if(!is_user_connected(id))
   {
    return PLUGIN_HANDLED
   }
   else
   {
    client_cmd(id, "slot1")
   }
   
   return PLUGIN_HANDLED
}
//----------------------------------------------------------//
public clcmd_fullupdate(id)
{
   return PLUGIN_HANDLED
}
