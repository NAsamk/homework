using System;

namespace ProxyPattern
{
    public class MainActor : IActor
    {
        public void PerformScene(string sceneType)
        {
            Console.WriteLine($"Main Actor : {sceneType}");
        }
    }
}
