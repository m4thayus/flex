# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


***Step 1***
```bash
bin/rails active_storage:install:migrations
bin/rails db:migrate
```

***Step 2***
-You don't need to use the Blob and Attachment directly. To attach one image to a Comment, use has_one_attached

```ruby
class Comment < ApplicationRecord
  has_one_attached :image
end
```

***Step 3***
```ruby
#Comment Model
has_many_attached :image

#Comment Controller
def create
    comment = Comment.create! params.require(:comment).permit(:content)
    comment.image.attach(params[:comment][:image])
    redirect_to comment    
  end
  # show for a comment
<%= image_tag @comment.image %>  
  
```
***Step 3***
- configure form for new comment
