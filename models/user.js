var mongodb = require('./db');

function User(user){
	this.name = user.name;
	this.password = user.password;
	this.email = user.email;
}

module.exports = User;

User.get = function(name,callback){
	mongodb.open(function(err,db){
		if(err){
			return callback(err);
		}

		db.collection('article',function(err,collection){
			if(err){
				mongodb.close();
				return callback(err);
			}
			collection.findOne({
				name:name
			},function(err,user){
				if(err){
					return callback(err);
				}
				callback(null,user);
			})
		})
	})
}