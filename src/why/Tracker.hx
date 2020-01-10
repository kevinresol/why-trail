package why;

using tink.CoreApi;

interface Tracker<TrailType> {
	function track(envelope:Envelope<TrailType>):Promise<Noise>;
	function batch(envelopes:Array<Envelope<TrailType>>):Promise<Noise>;
	function flush():Promise<Noise>;
}

typedef Envelope<TrailType> = {
	user:String,
	type:TrailType,
	?timestamp:Date,
	?immediate:Bool,
}

typedef TrackerOptions = {
	?flush: {
		memory:Int, // bytes
		interval:Int, // ms
	}
}