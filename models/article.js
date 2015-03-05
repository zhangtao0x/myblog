var mongodb = require('./db');
var markdown = require('markdown').markdown;
// var flash   = require('connect-flash');
function Article(article){
	this.name = article.name;
	this.title = article.title;
	this.post = article.post;
};

module.exports = Article;

Article.prototype.save = function(callback){
	var date = new Date();
	var time = {
		date:date,
		year:date.getFullYear(),
		month:date.getFullYear()+"-"+(date.getMonth()+1),
		day: date.getFullYear()+"-"+(date.getMonth()+1)+"-"+
		     date.getDate(),
		minute: date.getFullYear()+"-"+(date.getMonth()+1)+"-"+
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


Article.getAll = function(name,callback){
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
				docs.forEach(function(doc){
					doc.post = markdown.toHTML(doc.post);
				})
				callback(null,docs);
			});
		});
	});
}

Article.getOne = function(minute,title,callback){
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
			
			collection.findOne({
				"time.minute": minute,
				"title":title
			},function(err,doc){
				mongodb.close();
				if(err){
					return callback(err);
				}
				console.log(doc);
				doc.post = markdown.toHTML(doc.post);
				callback(null,doc);
			});
		});
	});
}

Article.edit = function(minute,title,callback){
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
				"time.minute":minute,
				"title":title
			},function(err,doc){
				mongodb.close();
				if(err){
					return callback(err);
				}
				callback(null,doc);
			})
		})
	})
}

Article.update = function(minute,title,post,callback){
	mongodb.open(function(err,db){
		if(err){
			return callback(err);
		}

		db.collection('posts',function(err,collection){
			if(err){
				mongodb.close();
				return callback(err);
			}

			collection.update({
				"time.minute":minute,
				"title":title
			},{
				$set: {post:post}
			},function(err){
				mongodb.close();
				if(err){
					return callback(err);
				}
				callback(null);
			})
		})
	})
}