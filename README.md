# 处理自定义Tabbar凸起后 的点击事件问题

在一些APP上 出现了自定义的tabbar后
<br>
![安全验证界面](http://img.bbs.csdn.net/upload/201508/06/1438852984_550810.png)
会出现不规则的tabbar 凸出后的部分不会响应事件


<br>
解决方法是重写hittest方法,改变坐标系为button 然后判断点是否子啊button内  去处理  上代码

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.isHidden == NO) {        
        CGPoint newP = [self convertPoint:point toView:self.plusBtn];
        if ( [self.plusBtn pointInside:newP withEvent:event]) {
            return self.plusBtn;
        }else{
          return [super hitTest:point withEvent:event];
     }
   } 
    else {
        return [super hitTest:point withEvent:event];
    }
}




