import gql from "graphql-tag";

export const SIGNIN_MUTATION = gql`
  mutation SignIn($input: SessionInput!) {
    loginUser(input: $input) {
      token
      user {
        id
      }
    }
  }
`;

export const SIGNUP_MUTATION = gql`
  mutation SignUp($input: UserInput!) {
    registerUser(input: $input) {
      id
    }
  }
`;

export const POSTS_QUERY = gql`
  query Posts {
    posts {
      id
      title

    }
  }
`;

export const POST_QUERY = gql`
  query Post($id: Int!) {
    post(id: $id) {
      id
    }
  }
`;
