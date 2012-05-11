package 
{
	import flash.geom.Vector3D;
	import away3d.cameras.Camera3D;
	import away3d.containers.View3D;

	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	import robotlegs.extensions.away3dViewMap.Away3DViewMapExtension;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	/**
	 * An example to demo the RL2 Away3D extension.
	 * 
	 * @author jamieowen
	 */
	public class Away3DExtensionExample extends Sprite
	{
		private var _view3D:View3D;
		private var _camera:Camera3D;
		private var _cameraAngle:Number;
		
		public function Away3DExtensionExample()
		{
			stage.align 		= StageAlign.TOP_LEFT;
			stage.scaleMode 	= StageScaleMode.NO_SCALE;
			
			init();
		}
		
		private function init():void
		{
			_view3D = new View3D();
			_camera = new Camera3D();
			_cameraAngle = 0;
			_view3D.camera = _camera;
			
			_view3D.scene.addChild( _camera );
			addChild( _view3D );
			// the Away3DScene3DMediator will add objects lights/etc
			
			// this setup is debatable.. 
			// e.g. you could handle the enter frame/ resize listener in a mediator class 
			
			const context:IContext = new Context()
				.extend( MVCSBundle, Away3DViewMapExtension )
				.configure( Away3DConfig, 
							this,
							_view3D );
			
			onResize();
			
			stage.addEventListener( Event.RESIZE, onResize );
			stage.addEventListener( Event.ENTER_FRAME, onEnterFrame );
		}
		
		private function onResize( event:Event = null ):void
		{
			_view3D.width 	= stage.stageWidth;
			_view3D.height 	= stage.stageHeight;
		}
		
		private function onEnterFrame( event:Event ):void
		{
			_view3D.render();
			
			_camera.moveTo( Math.cos( _cameraAngle )*400, 200, Math.sin(_cameraAngle)*400 );
			_camera.lookAt( new Vector3D(0,0,0) );
			_cameraAngle+=.02;
		}
	}
}
