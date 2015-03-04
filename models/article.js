var mongodb = require('./db');

function Article(article){
	this.name = article.name;
	this.date = article.date;
	this.file = article.file;
};

module.exports = Article;

Article.prototype.save = function(callback){
	var article = {
		name: this.name,
		date: this.date,
		file: this.file
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
				callback(null,article[0]);
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

			collection.findOne({
				name:name
			},function(err,article){
				mongodb.close();
				if(err){
					return callback(err);
				}
				callback(null,article);
			});
		});
	});
}