package uk.mafu.loon.responder
{
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.Swiz;
	
	import uk.mafu.flex.util.Util;
	import uk.mafu.loon.events.ManyToManySavedEvent;

	public class SaveManyToManyResponder extends AbstractResponder
	{
		private var parent_clazz:Class;
		private var parentId:Object;
		private var relationship:String;
		private var children:Array;
		
	 	public function SaveManyToManyResponder(
	 			parent_clazz:Class,
				parentId:Object,
				relationship:String,
				children:Array
	 	){
	 		this.parent_clazz = parent_clazz ;
	 		this.parentId = parentId ;
	 		this.relationship = relationship;
	 		this.children = children;
		}
		
		override public function result(data:Object):void{
			Util.debug((data as ResultEvent).result);
			Swiz.dispatchEvent(new ManyToManySavedEvent(parent_clazz,parentId,relationship,children));
		}
	}
}