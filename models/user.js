var mongodb = require('./db');

function User(user){
	this.name = user.name;
	this.password = user.password;
	this.email = user.email;
	this.access = 0;
	this.address = "";
	this.tel = "";
}

module.exports = User;

User.prototype.save = function(user,callback){
	mongodb.open(function(err,db){
		if(err)	return callback(err);

		db.collection('users',function(err,collection){
			if(err){
				// console.log(err);
				mongodb.close();
				return callback(err);
			}
			collection.insert({
				name:user.name,
				email:user.email,
				password:user.password,
				access:0,
				address:"",
				tel:""
			},function(err,user){
				// console.log(err);
				if(err){
					// console.log(err);
					mongodb.close();
					return callback(err);
				}
				mongodb.close();
				callback(null,user);
			})
		})
	})
}

User.get = function(user,callback){
	mongodb.open(function(err,db){
		if(err){
			return callback(err);
		}

		db.collection('users',function(err,collection){
			if(err){
				mongodb.close();
				return callback(err);
			}
			collection.findOne({
				email:user.email
			},function(err,user){
				console.log(user);
				mongodb.close();
				if(err){
					return callback(err);
				}
				// console.log(user)
				callback(null,user);
			})
		})
	})
}