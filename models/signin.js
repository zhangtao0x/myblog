var User = require('./user');
var crypto  = require('crypto');
var name = "zoro";
var md5 = crypto.createHash('md5');
var password = md5.update("ztcdd4027050").digest('hex');
var email = "zhangtao4027050@gmail.com";

var newUser = new User({
		name:"zoro",
		email:"zhangtao4027050@gmail.com",
		password:password
})

// console.log(newUser);
// newUser.save(newUser,function(err,user){
// 		if(err){
// 			console.log(err);
// 			return 0;
// 		}
// 		// req.session.user = user;
// 		// req.flash('info','注册成功');
// 		// res.redirect('/');
// 		console.log("注册成功");
// })
User.get(newUser,function(err,user){
	if(err){
		console.log(err);
		return 0;
	}
	if(user){
		console.log("用户已存在");
		return 0;
	}

	newUser.save(newUser,function(err,user){
		if(err){
			console.log(err);
			return 0;
		}
		// req.session.user = user;
		// req.flash('info','注册成功');
		// res.redirect('/');
		console.log("注册成功");
	})
})