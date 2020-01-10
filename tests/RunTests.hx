package ;

import tink.sql.drivers.MySql;

class RunTests {

  static function main() {
    var tracker = new why.trail.SqlTracker<Actions>('test', new MySql({user: 'root', password: ''}), new why.serialize.JsonSerializer(), null);
    tracker.track({user: 'me', type: Signup}).handle(o -> trace(o));
    
    // haxe.Timer.delay(function() trace('delayed'), 2000);
  }
  
}

enum Actions {
  @:json({a: 's'}) Signup;
}