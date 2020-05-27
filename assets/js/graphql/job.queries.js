import gql from 'graphql-tag';

export const allJobsQuery = gql`
  {
    jobs: allJobs {
      id
      title
      salary
      limit
      company {
        name
      },
      workers {
        id
      }
    }
  }
`;
