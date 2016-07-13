Example of Execution Output
==========================

Executing the command `lua test_tags.lua` the following output is generated:

```
    demo=	false
    hello=	false
    world=	false
    ok=	false
    ok=	true
    {
      status = {
        demo = false,
        hello = false,
        ok = true,
        world = false
      },
      <metatable> = {
        __call = <function 1>,
        __index = <function 2>,
        __newindex = <function 3>
      }
    }
    tags.demo --> false
    tags.ok --> true
    not (tags.hello and tags.world) and tags.ok --> true
    (tags.demo or tags.world) and tags.ok --> false
    demo=	true
    {
      status = {
        demo = true,
        hello = false,
        ok = true,
        world = false
      },
      <metatable> = {
        __call = <function 1>,
        __index = <function 2>,
        __newindex = <function 3>
      }
    }
    tags.demo --> true
    (tags.hello or tags.world) and tags.ok --> false
    (tags.hello or tags.world) and tags.ok or tags.demo --> true
```
