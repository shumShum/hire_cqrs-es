import gql from 'graphql-tag';

export const currentUserQuery = gql`
  {
    user: getUser {
      id
      name
      type
      job {
        title
        salary
        company {
          name
        }
      }
    }
  }
`;