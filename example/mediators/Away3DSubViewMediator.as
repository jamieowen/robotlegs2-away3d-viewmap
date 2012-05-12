package mediators
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;

	/**
	 * @author jamieowen
	 */
	public class Away3DSubViewMediator implements IMediator
	{
		public function Away3DSubViewMediator()
		{
			
		}
		
		public function set viewComponent(view:Object):void
		{
			trace( "rl2 standard set : " + view );
		}

		public function initialize():void
		{
			trace( "rl2 standard init " + this );
		}

		public function destroy():void
		{
			trace( "rl2 standard destroy " + this );
		}
	}
}
