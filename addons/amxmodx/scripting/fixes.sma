#include <amxmodx>
#include <amxmisc>
#include <fakemeta>


new userDir[32]
//----------------------------------------------------------//
public plugin_init()
{
   register_plugin("Fixes for 1.3", "0", "YoSoyNacho") // Plugin Information
   register_event("ResetHUD", "spawnfixes", "be")
   register_clcmd("fullupdate", "clcmd_fullupdate")
   register_clcmd("ascend", "meleefix")
   register_clcmd("descend", "meleefix")
   register_forward(FM_PlayerPreThink, "prethink",0)
   register_clcmd("teleport", "tpfix")
   
}

public client_disconnect(id)
{
   remove_task(id)
   return PLUGIN_HANDLED
}

public tpfix(id)
{
    console_print( id, "%d", userDir[id])
    set_pev(id,pev_button,userDir[id])
    return PLUGIN_CONTINUE
}

public prethink(id)
{
    // forward == 40 back=48 left=544 right=1056 34=jump 36=duck
    static button; 
    button = pev( id, pev_button ); 
    
    if( button & 48 ) //back
    {
        userDir[id]=button
    } 
    else if( button & 40 )  //fwd
    {
        userDir[id]=button
    }
    else if( button & 544 ) //left
    {
        userDir[id]=button
    }
    else if( button & 1056 ) //right
    {
        userDir[id]=button
    }
    else if( button & 34 ) //jmp
    {
        userDir[id]=button
    }
    else if( button & 36 ) //duck
    {
        userDir[id]=button
    }
}

//----------------------------------------------------------//

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
