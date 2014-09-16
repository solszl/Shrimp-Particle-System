package
{
	import com.shrimp.extensions.particle.player.SimLoader;
	import com.shrimp.extensions.particle.player.SimPlayer;
	import com.shrimp.framework.managers.WorldClockManager;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	[SWF(frameRate="60")]
	public class Main extends Sprite
	{
		[Embed(source="assets/particle/111.sde", mimeType="application/octet-stream")]
		private var SimWithBurstAndNormalClock:Class;
		private const simWithBurstAndNormalClock : ByteArray = new SimWithBurstAndNormalClock() as ByteArray;
		
		private var loader:SimLoader;
		public function Main()
		{
			loader = new SimLoader();
			loader.addEventListener(Event.COMPLETE,onLoaderComplete);
			loader.loadSim(simWithBurstAndNormalClock);
		}
		
		private var player:SimPlayer;
		protected function onLoaderComplete(event:Event):void
		{
			trace("loader load complete");	
			player = new SimPlayer();
			player.setSimulation(loader.project,this);
			WorldClockManager.getInstance().doFrameLoop(1,player.stepSimulation);
		}
		
		protected function onEnter(event:Event):void
		{
			player.stepSimulation();
		}
	}
}