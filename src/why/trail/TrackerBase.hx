package why.trail;

import why.Tracker;

class TrackerBase<TrailType, Representation> {
	final serializer:why.Serializer<TrailType, Representation>;
	final options:TrackerOptions;
	
	public function new(serializer, options) {
		this.serializer = serializer;
		this.options = options;
	}
	
	inline function getTimestamp(date:Date) {
		return date == null ? Date.now() : date;
	}
	
}