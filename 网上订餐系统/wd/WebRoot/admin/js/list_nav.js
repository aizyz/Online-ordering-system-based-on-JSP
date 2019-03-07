var t;



t=outlookbar.addtitle('修改密码')
outlookbar.additem('密码修改',t,'/wd/admin/userinfo/userPw.jsp')


t=outlookbar.addtitle('用户管理')
outlookbar.additem('用户管理',t,'/wd/userMana.action')

t=outlookbar.addtitle('菜品类别')
outlookbar.additem('类别管理',t,'/wd/catelogMana.action')
outlookbar.additem('添加类别',t,'/wd/admin/catelog/catelogAdd.jsp')

t=outlookbar.addtitle('菜品管理')
outlookbar.additem('菜品管理',t,'/wd/goodsMana.action')
outlookbar.additem('添加菜品',t,'/wd/admin/goods/goodsAdd.jsp')


t=outlookbar.addtitle('订单管理')
outlookbar.additem('订单管理',t,'/wd/orderMana.action')

t=outlookbar.addtitle('留言管理')
outlookbar.additem('留言管理',t,'/wd/liuyanMana.action')


t=outlookbar.addtitle('退出系统') 
outlookbar.additem('安全退出',t,'/wd/login.jsp')