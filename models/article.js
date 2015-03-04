var mongodb = require('./db');
var flash   = require('connect-flash');
function Article(article){
	this.name = article.name;
	this.title = article.title;
	// this.time = article.time;
	this.post = article.post;
};

module.exports = Article;

Article.prototype.save = function(callback){
	var date = new Date();
	var time = {
		date:date,
		year:date.getFullYear(),
		month:date.getFullYear()+"-"+(date.getMonth()+1),
		day: date.getFullYear()+"-"+(date.getMonth()+1)+
		     date.getDate(),
		minute: date.getFullYear()+"-"+(date.getMonth()+1)+
		     date.getDate()+"-"+date.getHours()+":"+
		     (date.getMinutes() < 10 ? '0' + date.getMinutes():date.getMinutes())
	}
	//存入数据库的数据
	var article = {
		name: this.name,
		time: time,
		title:this.title,
		post:this.post
	};

	mongodb.open(function(err,db){
		if(err){
			return callback(err);
		}

		db.collection('article',function(err,collection){
			if(err){
				mongodb.close();
				return callback(err);
			}

			collection.insert(article,{safe:true},function(err, article){
				mongodb.close();
				if(err){
					return callback(err);
				}
				callback(null);
			});
		});
	});
};


Article.get = function(name,callback){
	//打开数据库
	mongodb.open(function(err,db){
		if(err){
			return callback(err);
		}

		//读取article集合
		db.collection('article',function(err,collection){
			if(err){
				mongodb.close();
				return callback(err);
			}
			var query = {};
			if(name){
				query.name=name;
			}

			collection.find(query).sort({
				time:-1
			}).toArray(function(err,docs){
				mongodb.close();

				if(err){
					return callback(err);
				}

				callback(null,docs);
			});
		});
	});
}