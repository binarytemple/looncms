package uk.mafu.domain.maverick
{
	import uk.mafu.loon.domain.data.ImageLink;
	
	[RemoteClass(alias="uk.mafu.domain.maverick.Award")]
	[Tab(title="Main",order=1,
		field=title,
		field=date,
		field=text,
		field=image,
		field=project
	)]
	[Order(col="pk",asc="false")]
	[Columns(col="pk",col="title")]
	[Chooser(label="title")]
	[Bindable]
	public class Award
	{
		public var pk:Number =-1;
		
		[Display(label="Name",lines=1)]
		public var title:String;

		[Display(label="Date")]
		public var date:Date;
		
		[Display(label="Text",lines=20,widget=RichTextWidget)]
		public var text:String;
	
		[Display(label="Image",widget=SingleImage)]
		public var image:ImageLink;
	
		[Display(label="Project")]
		[Relationship(end="uk.mafu.domain.maverick::Project",type="ONE_TO_ONE")]
		public var project:Project;
	  	
	  	public var permalink:String;
	  
	}
}