var express = require('express');
var router  = express.Router();
var Article = require('../models/article.js');
var flash   = require('connect-flash');
/*
/* GET home page. *//*
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;*/

module.exports=function(app){
	app.get('/',function(req,res){
		Article.get(null,function(err,posts){
			if(err){
				posts=[];
			}
			res.render('index',{
				title:'主页',
				posts:posts,
				// success:req.flash('success').toString,
				// error:req.flash('error').toString
			})
		})
	});

	app.get('/article',function(req,res){
		res.render('article',{title: '文章'});
	})

	app.get('/post',function(req,res){
		res.render('post',{
			title:'发表'
			// success:req.flash('success').toString(),
			// error:req.flash('error').toString()
		})
	})

	app.post('/post',function(req,res){
		var post = new Article('',req.body.title,req.body.post);
		console.log(post.title);
		post.save(function(err){
			if(err){
				// req.flash('error',err);
				return res.redirect('/');
			}

			// req.flash('success','发表成功');
			res.redirect('/');
		})
	})
}