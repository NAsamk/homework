using System;

namespace ProxyPattern
{
    class Program
    {
        static void Main(string[] args)
        {
            IActor actor = new ActorProxy();

            actor.PerformScene("Simple");     // გადაიღებს მთავარი მსახიობი
            actor.PerformScene("Dangerous");  // გადაიღებს კასკადიორი

            Console.ReadKey();
        }
    }
}
