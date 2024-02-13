state("Budget Cuts 2")
{
    int mission: "GameAssembly.dll", 0x20707B8, 0xB8, 0x0, 0x48;
    int pauseMenuOpen: "GameAssembly.dll", 0x2092CE0, 0xB8, 0x0, 0x28;
    //int igt: "lib_burst_generated.dll", 0x34E28, 0x2B0, 0x170, 0xE10, 0xF58;
    int igt: "UnityPlayer.dll", 0x1575C48, 0x30;
}

start
{
    return current.Scene == "Conductor";
    vars.notPaused = current.pauseMenuOpen;
}

startup
{
  Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
  vars.Helper.LoadSceneManager = true;
  vars.notPaused = 0; 
  vars.stopwatch = new Stopwatch();
  vars.consecutiveTrues = 0;
}

split
{
    return current.Scene != old.Scene;
}

    //FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU FUCK YOU 

isLoading
{

    //if (current.mission == 0 && current.pauseMenuOpen != -1) //&& pauseMenuOpen == 0)
    //{
    //    return true;
    //}
    //if ((old.mission == 0 && current.mission != 0 && current.pauseMenuOpen != -1))
    //{
    //    return false;
    //}

    //if (current.pauseMenuOpen != vars.notPaused)
    //    {
    //        if (current.mission == 0 && current.pauseMenuOpen == vars.notPaused)
    //        {
    //            return false;
    //        }
    //        return false;
    //        
    //    }
    //if (current.mission == 0 && current.pauseMenuOpen != -1)
    //{
    //    return true;
    //}
    //else
    //{
    //    return false;
    //}

    return (vars.consecutiveTrues >= 2);
}

update
{
    current.Scene = vars.Helper.Scenes.Active.Name ?? current.Scene;
    current.loadState = vars.Helper.IsLoading ?? current.loadState;

    if (current.Scene != old.Scene)
    {
        vars.stopwatch.Start();
    }
    if (vars.stopwatch.ElapsedMilliseconds >= 1000)
    {
        vars.stopwatch.Reset();
        vars.notPaused = current.pauseMenuOpen;
    }

    if (current.igt == old.igt)
    {
        vars.consecutiveTrues++;
    }
    else
    {
        vars.consecutiveTrues = 0;
    }

    //print(vars.consecutiveTrues.ToString());
    
}

reset
{
    return current.Scene == "Main Menu BC2";
}
