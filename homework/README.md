Home Work
========
### __light_web__
实现一个类sinatra的web框架，要求：

- 能够响应`GET`，`POST`，`POST`，`DELETE`请求。
- 能够对不同的url做出不同的响应。
- 能够从url中匹配出请求参数。
更多细节请参考`light_web_spec.rb`。

### __InactiveRecord__

假设我们有一个类似于ActiveRecord的包InactiveRecord，它可以提供给开发者一个很方便的方式来定义model，比如我们有一个表示人(Person)的数据对象，则我们仅仅需要定义一个空的类Person，只要这个类继承了InactiveRecord::Base， 那么这个类就自动拥有了getter/setter方法，而且还有一个save方法(目前仅仅用于属性有没有被设置到对象上)。

更多细节，请参考`inactive_record_spec.rb`。
