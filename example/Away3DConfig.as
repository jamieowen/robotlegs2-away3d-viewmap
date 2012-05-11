package {
	import away3d.containers.Scene3D;

	import mediators.Away3DScene3DMediator;
	import mediators.Away3DSubViewMediator;

	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	import views.Away3DSubView;

	/**
	 * @author jamieowen
	 */
	public class Away3DConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		public function configure() : void
		{
			mediatorMap.map( Scene3D ).toMediator(Away3DScene3DMediator);
			
			mediatorMap.map( Away3DSubView ).toMediator(Away3DSubViewMediator);
		}
	}
}
