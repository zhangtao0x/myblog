var express = require('express');
var router = express.Router();
var Article = require('../models/article.js');
/*
/* GET home page. *//*
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;*/

module.exports=function(app){
	app.get('/',function(req,res){
		res.render('index',{title: '主页'});
	});

	app.get('/article',function(req,res){
		res.render('article',{title: '文章'});
	})
}