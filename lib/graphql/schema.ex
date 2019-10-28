defmodule MediumGraphqlApiWeb.Schema do
    use Absinthe.Schema

    import_types __MODULE__.UserTypes
    import_types __MODULE__.SessionTypes
    import_types __MODULE__.PostTypes
    import_types __MODULE__.CommentTypes
  
    query do
      @desc "get a list of posts"
      field :posts, list_of(:post) do
        resolve &__MODULE__.PostResolver.posts/3
      end
  
      @desc "get a post by id"
      field :post, list_of(:post) do
        arg(:id, non_null(:id))
        resolve &__MODULE__.PostResolver.post/3
      end
  
      @desc "get a list of users"
      field :users, list_of(:user) do
        middleware __MODULE__.Middleware.Authorize, :any
  
        resolve &__MODULE__.UserResolver.users/3
      end
    end
  
    mutation do
      @desc "Register a new user"
      field :register_user, type: :user do
        arg(:input, non_null(:user_input))
  
        resolve(&__MODULE__.UserResolver.register_user/3)
      end
  
      @desc "Login a user and return a JWT token"
      field :login_user, type: :session do
        arg(:input, non_null(:session_input))
  
        resolve &__MODULE__.SessionResolver.login_user/3
      end
  
      @desc "Create a post"
      field :create_post, type: :post do
        arg(:input, non_null(:post_input))
        
        middleware __MODULE__.Middleware.Authorize, :any
        resolve &__MODULE__.PostResolver.create_post/3
      end
  
      @desc "Create a comment"
      field :create_comment, type: :comment do
        arg(:input, non_null(:comment_input))
  
        middleware __MODULE__.Middleware.Authorize, :any
        resolve &__MODULE__.CommentResolver.create_comment/3
      end
    end
end