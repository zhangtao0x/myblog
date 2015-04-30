var crypto  = require('crypto');
var User    = require('../models/user.js')
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
		var page = req.query.p ? parseInt(req.query.p) : 1;
		Article.getTen(null,page,function(err,posts,total){
			if(err){
				posts=[];
			}
			res.render('index',{
				title:'主页',
				posts:posts,
				page:page,
				isFirstPage: (page -1) == 0,
				isLastPage: ((page - 1) * 10 + posts.length) == total,
				flash: req.flash('info').toString()
			})
		})
	});

	// app.get('/reg',function(req,res){
	// 	res.render('reg',
	// 	{
	// 		title:'注册',
	// 		flash: req.flash('info').toString()
	// 	})
	// })

	// app.post('/reg',function(req,res){
	// 	// console.log('register');
	// 	var email = req.body.email,
	// 		password = req.body.password,
	// 		password_repeat = req.body['password-repeat'];
	// 		// console.log(password,password_repeat);
	// 	if(password !== password_repeat){
	// 		req.flash('info','两次输入密码不一致');
	// 		return res.redirect('/reg');
	// 	}
	// 	var md5 = crypto.createHash('md5');
	// 	var password = md5.update(req.body.password).digest('hex');

	// 	var newUser = new User({
	// 		// name:""
	// 		email:email,
	// 		password:password
	// 	})
	// 	console.log(newUser);
	// 	User.get(newUser,function(err,user){
	// 		if(err){
	// 			req.flash('info',JSON.stringify(err));
	// 			return res.redirect('/');
	// 		}
	// 		if(user){
	// 			req.flash('info','用户已存在');
	// 			return res.redirect('/reg');
	// 		}

	// 		newUser.save(newUser,function(err,user){
	// 			if(err){
	// 				req.flash('info',JSON.stringify(err));
	// 				return res.redirect('/reg');
	// 			}
	// 			req.session.user = user;
	// 			req.flash('info','注册成功');
	// 			res.redirect('/');
	// 		})
	// 	})
	// })

	app.get('/login',function(req,res){
		res.render('login',
			{
				title: '登录',
				user: req.session.user,
				flash: req.flash('info').toString()
			})
	})

	app.post('/login',function(req,res){
		// req.flash('info',req.body);
		// res.redirect("/");
		console.log(req.body);
		User.get(req.body.name,function(err,user){
			if(!user){
				req.flash('info','用户不存在');
				return res.redirect('/login');
			}

			if(user.password != password){
				req.flash('info','密码错误');
			}

			req.session.user = user;
			req.info('登录成功!');
			res.redirect('/post');
		})
	})

	app.get('/article',function(req,res){
		res.render('article',{title: '文章'});
	})

	app.get('/search', function(req,res){
		Article.search(req.query.keyword,function(err,posts){
			if(err){
				req.flash('info',err);
				return res.redirect('/');
			}
			res.render('search',{
				title:"SEARCH:"+req.query.keyword,
				posts:posts,
				flash:req.flash('info').toString()
			})
		})
	})

	app.get('/post',checkNotLogin);
	app.get('/post',function(req,res){
		res.render('post',{
			title:'发表',
			flash: req.flash('info').toString()
		})
	})

	app.post('/post',function(req,res){
		// console.log(req.body);
		var post = new Article({name:'',title:req.body.title,post:req.body.post});
		// console.log(post.title);
		post.save(function(err){
			if(err){
				req.flash('info',err);
				return res.redirect('/');
			}
			req.flash('info','发表成功');
			res.redirect('/');
			})
	})

	app.get('/upload',function(req,res){
		res.render('upload',{
			title:'文件上传',
			flash: req.flash('info').toString()
		});
	});

	app.post('/upload',function(req,res){
		req.flash('info','上传成功');
		res.redirect('/');
	});

	app.get('/u/:minute/:title',function(req,res){
		Article.getOne(req.params.minute,req.params.title,function(err,post){
			if(err){
				req.flash('info',err);
				return res.redirect('/');
			}
			res.render('article',{
				title:req.params.title,
				post:post,
				flash: req.flash('info').toString()
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
				post:post,
				flash: req.flash('info').toString()
			})
		})
	})

	app.post('/edit/:minute/:title',function(req,res){
		Article.update(req.params.minute,req.params.title,req.body.post,function(err){
			var url = encodeURI('/u/'  + req.params.minute + '/' + req.params.title);
			if(err){
				req.flash('info',err);
				return res.redirect(url);
			}
			req.flash('info','修改成功');
			res.redirect(url);
		})
	})

	app.get('/remove/:minute/:title',function(req,res){
		Article.remove(req.params.minute, req.params.title,function(err){
			console.log(err);
			if(err){
				req.flash('info',err);
				return res.redirect('back');
			}
			req.flash('info',"删除成功");
			res.redirect('/');
		})
	})

	app.use(function (req, res) {
	  res.render("404");
	});


	function checkLogin(req,res,next){
		if(!req.session.user){
			req.flash('info',"未登录!");
			res.redirect('/login');
			return；
		}
		next();
	}

	function checkNotLogin(req,res,next){
		if(req.session.user){
			req.flash('info','已登录!');
			req.redirect('back');
			return;
		}
		next();
	}
}


