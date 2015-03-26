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


Article.getTen = function(name,page,callback){
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

			collection.count(query,function(err,total){
				collection.find(query, {
					skip:(page-1)*10,
					limit:10
				}).sort({
					time:-1
				}).toArray(function(err,docs){
					mongodb.close();
					if(err){
						return callback(err);
					}

					docs.forEach(function(doc){
						doc.post = markdown.toHTML(doc.post);
					});
					callback(null,docs,total);
				})
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
				// console.log(doc);
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

		db.collection('article',function(err,collection){
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

Article.remove = function(minute,title,callback){
	mongodb.open(function(err,db){
		if(err){
			return callback(err);
		}

		db.collection('article',function(err,collection){
			if(err){
				mongodb.close();
				return callback(err);
			}

			collection.remove({
				"time.minute":minute,
				"title":title
			},{w:1},function(err){
				mongodb.close();
				if(err){
					return callback(err);
				}
				callback(null);
			})
		})
	})
}

Article.search = function(keyword,callback){
	mongodb.open(function(err,db){
		if(err){
			return callback(err);
		}
		db.collection("article",function(err,collection){
			if(err){
				mongodb.close();
				return callback(err);
			}
			var pattern = new RegExp(keyword,'i');
			collection.find({
				"title":pattern
			},{
				// "name":1,
				"time":1,
				"title":1
			}).sort({
				time:-1
			}).toArray(function(err,docs){
				mongodb.close();
				if(err){
					return callback(err);
				}
				callback(null,docs);
			})
		})
	})
}