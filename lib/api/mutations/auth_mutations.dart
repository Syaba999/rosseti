const String userLogin = r'''
mutation UserLogin($email: String!, $password: String!){
  userLogin(email: $email, password: $password){
    authenticatable {
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
    }
  }
}
''';
