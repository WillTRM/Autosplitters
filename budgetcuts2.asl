state("Budget Cuts 2")
{
    int mission: "GameAssembly.dll", 0x20707B8, 0xB8, 0x0, 0x48;
}

start
{
    if (current.Scene == "Conductor")
    {
        return true;
    }
}

startup
{
  Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
  vars.Helper.LoadSceneManager = true;
}

split
{
    if (current.Scene != old.Scene)
    {
        return true;
    }
}

isLoading
{
    if (current.mission == 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

update
{
    current.Scene = vars.Helper.Scenes.Active.Name ?? current.Scene;
}

reset
{
    if (current.Scene == "Main Menu BC2")
    {
        return true;
    }
    else
    {
        return false;
    }
}