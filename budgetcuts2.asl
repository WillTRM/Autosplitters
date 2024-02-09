state("Budget Cuts 2")
{
    //int mission: "GameAssembly.dll", 0x20707B8, 0xB8, 0x0, 0x48;
}

start
{
    return current.Scene == "Conductor";
}

startup
{
  Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
  vars.Helper.LoadSceneManager = true;
}

split
{
    return current.Scene != old.Scene;
}

isLoading
{
    return current.loadState;
}

update
{
    current.Scene = vars.Helper.Scenes.Active.Name ?? current.Scene;
    current.loadState = vars.Helper.IsLoading ?? current.loadState;
}

reset
{
    return current.Scene == "Main Menu BC2";
}
