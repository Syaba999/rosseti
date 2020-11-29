const String getUser = r'''
query GetUser($id: ID!){
  user(id: $id){
    id
    role
    birthYear
    company {
      id
      name
      number
    }
    department {
      id
      name
      company {
        id
        name
        number
      }
    }
    education
    email
    experienceYears
    firstName
    lastName
    middleName
    position
    role
    rating
  }
}
''';

const String users = r'''
query {
  users {
    id
    firstName
    lastName
    middleName
    rating
  }
}
''';
