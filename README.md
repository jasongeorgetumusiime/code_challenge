# code_challenge
Ruby Code Challenge to [problem](https://gist.github.com/autonomous/56630836b491734211c440f16bcb53a9)

Details
-------
class `HtmlMarker` in `html_marker.rb` does all the heavy lifting.

How to run
----------

clone repo `git clone https://github.com/jasongeorgetumusiime/code_challenge.git`

`cd code_challenge`

`ruby ./app.rb data.txt`

Notes
-----

`app.rb` gets its data set from `data.txt`. Here is a sample data set.

```
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas consectetur malesuada velit, sit amet porta magna maximus nec. Aliquam aliquet tincidunt enim vel rutrum. Ut augue lorem, rutrum et turpis in, molestie mollis nisi. 

Ut dapibus erat eget felis pulvinar, ac vestibulum augue bibendum. Quisque sagittis magna nisi. Sed aliquam porttitor fermentum. Nulla consequat justo eu nulla sollicitudin auctor. Sed porta enim non diam mollis, a ullamcorper dolor 

molestie. Nam eu ex non nisl viverra hendrerit. Donec ante augue, eleifend vel eleifend quis, laoreet volutpat ipsum. Integer viverra aliquam nulla, ac rutrum dui sodales nec.

Sed turpis enim, porttitor nec maximus sed, luctus pretium elit. Sed sodales imperdiet velit, vitae viverra erat commodo non. Nunc porttitor risus sit amet quam faucibus, et luctus ex fringilla. Mauris quis urna non lacus 

tempor iaculis vitae quis dolor. Nam vitae pulvinar lacus, quis varius erat. Etiam lobortis orci vitae elementum tempor. Praesent convallis euismod enim vel vestibulum. Proin vitae eros vitae nisi cursus dapibus vitae 

at ipsum. Phasellus sed tempor eros, non scelerisque nunc. Nullam condimentum ex ultrices, ultrices ante sit amet, rhoncus nibh. Aliquam fermentum vulputate fringilla. Ut risus orci, pharetra eu tellus vel, fringilla feugiat dolor.

Nunc quis elit quam. Sed aliquet, nibh ut sagittis egestas, lorem tortor laoreet diam, non maximus lectus dolor dignissim eros. Sed vehicula mi id aliquet aliquam. Vestibulum sed lacus et 

neque dictum convallis in vitae mauris. Etiam varius augue vel mattis tempor. Curabitur mattis facilisis metus, tempus consectetur quam aliquam sed. Mauris velit orci, efficitur sit amet nisl in
```

With the following highlists input:

```
highlights = [{
  start: 20,
  end: 35,
  comment: 'Foo'
}, {
  start: 73,
  end: 92,
  comment: 'Bar'
}, {
  start: 50,
  end: 98,
  comment: 'Baz'
}]
```
HTML output is save in `output.html` that generates highlighted paragraphs with unique random colors.

`HtmlMarker.new(data, highlights).to_html_doc` produces the following html page.

![Sample output document](https://github.com/jasongeorgetumusiime/code_challenge/blob/main/outpu.html.png)

Possible Improvements
---------------------
- Scale solution to cater for more than just `<p>` tags
- Allow proper overlapping of highlights and color them uniquely
- Find a better solution than hard coding indices when inserting highlighting marks
