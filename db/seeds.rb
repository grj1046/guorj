# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#默认用户
User.create(name: 'admin', 
             email: 'admin@guorj.com',
             admin: true,
             password: 'foobar',
             password_confirmation: 'foobar' )

# 默认配置项
#如需新增设置项，请在这里初始化默认值，然后到后台修改

# about me HTML
SiteConfig.save_default("about_html", <<-eos
关于网站
eos
)
