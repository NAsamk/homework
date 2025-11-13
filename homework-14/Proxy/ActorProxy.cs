using System;

namespace ProxyPattern
{
    public class ActorProxy : IActor
    {
        private readonly MainActor _mainActor;
        private readonly StuntDouble _stuntDouble;

        public ActorProxy()
        {
            _mainActor = new MainActor();
            _stuntDouble = new StuntDouble();
        }

        public void PerformScene(string sceneType)
        {
            if (sceneType == "Simple")
            {
                _mainActor.PerformScene(sceneType);
            }
            else if (sceneType == "Dangerous")
            {
                _stuntDouble.PerformScene(sceneType);
            }
            else
            {
                Console.WriteLine("❓ უცნობი სცენის ტიპი!");
            }
        }
    }
}
