using System;

namespace ProxyPattern
{
    public class StuntDouble : IActor
    {
        public void PerformScene(string sceneType)
        {
            Console.WriteLine($"Stunt Double: {sceneType}");
        }
    }
}
