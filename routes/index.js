var express = require('express');
var router  = express.Router();
var Article = require('../models/article.js');
// var flash   = require('connect-flash');
/*
/* GET home page. *//*
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;*/

module.exports=function(app){
	app.get('/',function(req,res){
		Article.getAll(null,function(err,posts){
			if(err){
				posts=[];
			}
			res.render('index',{
				title:'主页',
				posts:posts,
				success:req.flash('success').toString(),
				error:req.flash('error').toString()
			})
		})
	});

	app.get('/article',function(req,res){
		res.render('article',{title: '文章'});
	})

	app.get('/post',function(req,res){
		res.render('post',{
			title:'发表'
		})
	})

	app.post('/post',function(req,res){
		// console.log(req.body);
		var post = new Article({name:'',title:req.body.title,post:req.body.post});
		// console.log(post.title);
		post.save(function(err){
			if(err){
				req.flash('error',err);
				return res.redirect('/');
			}
			req.flash('success','发表成功');
			res.redirect('/');
			})
	})

	app.get('/upload',function(req,res){
		res.render('upload',{
			title:'文件上传',
			success:req.flash('success').toString(),
			error:req.flash('error').toString()
		});
	});

	app.post('/upload',function(req,res){
		req.flash('success','上传成功');
		res.redirect('/');
	});

	app.get('/u/:minute/:title',function(req,res){
		Article.getOne(req.params.minute,req.params.title,function(err,post){
			if(err){
				req.flash('error',err);
				return res.redirect('/');
			}
			req.flash('success','success');
			res.render('article',{
				title:req.params.title,
				post:post,
				success:req.flash('success').toString(),
				error:req.flash('error').toString()
			});
		})
		
	});

	app.get('/edit/:minute/:title',function(req,res){
		// console.log("title:=================>"+req.params.title)
		Article.edit(req.params.minute,req.params.title,function(err,post){
			if(err){
				return res.redirect('back');
			}
			res.render('edit',{
				title:'编辑',
				post:post
			})
		})
	})

}