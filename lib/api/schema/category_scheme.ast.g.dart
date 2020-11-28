import 'package:gql/ast.dart' as _i1;

const Category = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'Category'),
    description: null,
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          description: null,
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'ID'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'title'),
          description: null,
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false))
    ]);
const document = _i1.DocumentNode(definitions: [Category]);
