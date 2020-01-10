package why.trail;

import why.Tracker;
import tink.sql.Types;

using tink.CoreApi;

class SqlTracker<TrailType> extends TrackerBase<TrailType, String> implements Tracker<TrailType> {
	final table:Table;
	
	public function new(table, serializer, options) {
		super(serializer, options);
		this.table = table;
	}
	
	
	public function track(envelope:Envelope<TrailType>):Promise<Noise> {
		return table.insertOne({
			id: null,
			user: envelope.user,
			type: serializer.serialize(envelope.type),
			timestamp: getTimestamp(envelope.timestamp),
		});
	}
	
	public function batch(envelopes:Array<Envelope<TrailType>>):Promise<Noise> {
		return table.insertMany([for(envelope in envelopes) {
			id: null,
			user: envelope.user,
			type: serializer.serialize(envelope.type),
			timestamp: getTimestamp(envelope.timestamp),
		}]);
	}
	
	public function flush():Promise<Noise> {
		return new Error(NotImplemented, 'SqlTracker#flush is not implemented');
	}
	
	
}

private typedef Table = tink.sql.Table<{trail:Trail}>;

typedef Trail = {
	@:primary @:autoIncrement var id:Int;
	var user:VarChar<255>;
	var type:Text;
	var timestamp:DateTime;
}