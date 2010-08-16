package uk.mafu.loon.events
{
	import flash.events.Event;
	
	import uk.mafu.flex.util.Assert;
	import uk.mafu.flex.util.Util;
	import uk.mafu.loon.dto.ManyToManyResult;
	
	public class ManyToManyLoadedEvent extends Event
	{
		public var result:ManyToManyResult;
		public static const NAME:String = Util.getFullClassName(ManyToManyLoadedEvent);
		
		public function ManyToManyLoadedEvent(result:ManyToManyResult) {
        	super(Util.getFullClassName(this), true,true);
        	Assert.notNull(result,"result may not be null");
        	this.result = result; 
        	Util.debug("created new:" + Util.getClassname(this) );
        }

    	/**
     	*  @private
     	*/
    	override public function clone():Event{
       		return Util.cloneObject(this) as Event;
    	}
	}
}