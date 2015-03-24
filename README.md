---
tags: logic, cs, monkey patching, todo, custom methods
languages: ruby
resources: 1
---

# Array Math

![math operators](https://s3-us-west-2.amazonaws.com/web-dev-readme-photos/cs/math.jpg)

## Objective

You will be building out Ruby's array `#*` and `#+` methods. Take a look at them below.

## `#+`

The `+` method adds one array to another array:

```ruby
[ 1, 2, 3 ] + [ 4, 5 ]
#=> [ 1, 2, 3, 4, 5 ]

[ "a", "b", "c" ] + [ "d", "e", "f" ]
#=> [ "a", "b", "c", "d", "e", "f" ]
```
Take a look at the Ruby docs on `#+` (http://ruby-doc.org/core-2.2.0/Array.html#method-i-2B). You'll be calling your version of this method `#plus`.

## `#*`

The simple version of the `*` method duplicates the elements in the array by the number that follows the asterisk.

```ruby
[ "a", "b"] * 2
#=> ["a", "b", "a", "b"]

[ 1, 2, 3 ] * 3
#=> [ 1, 2, 3, 1, 2, 3, 1, 2, 3 ]
```

However, if a string follows the asterisk, then the array is joined on that string.

```ruby
[ 1, 2, 3 ] * ","
#=> "1,2,3"
```

Take a look at the Ruby docs on `#*` [here](http://ruby-doc.org/core-2.2.0/Array.html#method-i-2A). You'll be calling your version of this method `#asterisk`.

## `#&`

The `&` method returns an array containing every element that the two arrays have in common. This returned array is unique (has no duplicate characters) and the order of the first array is preserved.

```ruby
[ 1, 1, 3, 5 ] & [ 1, 2, 3 ]
#=> [ 1, 3 ]

[ 'a', 'b', 'b', 'z' ] & [ 'a', 'b', 'c' ]
#=> [ 'a', 'b' ]


[ 'd', 'c', 'b', 'a' ] & [ 'a', 'c' ]
#=> [ 'c', 'a' ]
```

Take a look at the Ruby docs on `#&` [here](http://ruby-doc.org/core-2.2.0/Array.html#method-i-26). You'll be calling your version of this method `#ampersand`.

## Notes

Do not call on Ruby's `#*`, `#+`, and ``#&` methods to accomplish this.

## Resources

* [Plus Sign Method](http://ruby-doc.org/core-2.2.0/Array.html#method-i-2B)
* [Asterisk Method](http://ruby-doc.org/core-2.2.0/Array.html#method-i-2A)
* [Ampersand Method](http://ruby-doc.org/core-2.2.0/Array.html#method-i-26)
