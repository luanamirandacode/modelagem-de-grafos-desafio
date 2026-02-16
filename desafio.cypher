// Constraints para IDs únicos
CREATE CONSTRAINT user_id IF NOT EXISTS FOR (u:User) REQUIRE u.id IS UNIQUE;
CREATE CONSTRAINT movie_id IF NOT EXISTS FOR (m:Movie) REQUIRE m.id IS UNIQUE;
CREATE CONSTRAINT series_id IF NOT EXISTS FOR (s:Series) REQUIRE s.id IS UNIQUE;
CREATE CONSTRAINT genre_id IF NOT EXISTS FOR (g:Genre) REQUIRE g.id IS UNIQUE;
CREATE CONSTRAINT actor_id IF NOT EXISTS FOR (a:Actor) REQUIRE a.id IS UNIQUE;
CREATE CONSTRAINT director_id IF NOT EXISTS FOR (d:Director) REQUIRE d.id IS UNIQUE;

// Usuários
CREATE (:User {id:1, name:"Luana"});
CREATE (:User {id:2, name:"Carlos"});
CREATE (:User {id:3, name:"Mariana"});
CREATE (:User {id:4, name:"João"});
CREATE (:User {id:5, name:"Fernanda"});
CREATE (:User {id:6, name:"Pedro"});
CREATE (:User {id:7, name:"Ana"});
CREATE (:User {id:8, name:"Ricardo"});
CREATE (:User {id:9, name:"Sofia"});
CREATE (:User {id:10, name:"Mateus"});

// Filmes
CREATE (:Movie {id:101, title:"Inception"});
CREATE (:Movie {id:102, title:"Matrix"});
CREATE (:Movie {id:103, title:"Interstellar"});
CREATE (:Movie {id:104, title:"The Dark Knight"});
CREATE (:Movie {id:105, title:"Titanic"});

// Séries
CREATE (:Series {id:201, title:"Breaking Bad"});
CREATE (:Series {id:202, title:"Stranger Things"});
CREATE (:Series {id:203, title:"Game of Thrones"});
CREATE (:Series {id:204, title:"The Crown"});
CREATE (:Series {id:205, title:"The Office"});

// Gêneros
CREATE (:Genre {id:301, name:"Sci-Fi"});
CREATE (:Genre {id:302, name:"Drama"});
CREATE (:Genre {id:303, name:"Action"});
CREATE (:Genre {id:304, name:"Comedy"});
CREATE (:Genre {id:305, name:"Fantasy"});

// Atores
CREATE (:Actor {id:401, name:"Leonardo DiCaprio"});
CREATE (:Actor {id:402, name:"Keanu Reeves"});
CREATE (:Actor {id:403, name:"Bryan Cranston"});
CREATE (:Actor {id:404, name:"Millie Bobby Brown"});
CREATE (:Actor {id:405, name:"Emilia Clarke"});

// Diretores
CREATE (:Director {id:501, name:"Christopher Nolan"});
CREATE (:Director {id:502, name:"James Cameron"});
CREATE (:Director {id:503, name:"Vince Gilligan"});
CREATE (:Director {id:504, name:"Duffer Brothers"});
CREATE (:Director {id:505, name:"Peter Jackson"});

// Relacionamentos WATCHED com rating
MATCH (u:User {id:1}), (m:Movie {id:101}) CREATE (u)-[:WATCHED {rating:5}]->(m);
MATCH (u:User {id:2}), (s:Series {id:201}) CREATE (u)-[:WATCHED {rating:4}]->(s);
MATCH (u:User {id:3}), (m:Movie {id:102}) CREATE (u)-[:WATCHED {rating:5}]->(m);
MATCH (u:User {id:4}), (s:Series {id:202}) CREATE (u)-[:WATCHED {rating:3}]->(s);
MATCH (u:User {id:5}), (m:Movie {id:103}) CREATE (u)-[:WATCHED {rating:5}]->(m);
MATCH (u:User {id:6}), (s:Series {id:203}) CREATE (u)-[:WATCHED {rating:4}]->(s);
MATCH (u:User {id:7}), (m:Movie {id:104}) CREATE (u)-[:WATCHED {rating:5}]->(m);
MATCH (u:User {id:8}), (s:Series {id:204}) CREATE (u)-[:WATCHED {rating:4}]->(s);
MATCH (u:User {id:9}), (m:Movie {id:105}) CREATE (u)-[:WATCHED {rating:3}]->(m);
MATCH (u:User {id:10}), (s:Series {id:205}) CREATE (u)-[:WATCHED {rating:5}]->(s);

// Relacionamentos ACTED_IN
MATCH (a:Actor {id:401}), (m:Movie {id:101}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:402}), (m:Movie {id:102}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:403}), (s:Series {id:201}) CREATE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id:404}), (s:Series {id:202}) CREATE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id:405}), (s:Series {id:203}) CREATE (a)-[:ACTED_IN]->(s);

// Relacionamentos DIRECTED
MATCH (d:Director {id:501}), (m:Movie {id:101}) CREATE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id:501}), (m:Movie {id:103}) CREATE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id:502}), (m:Movie {id:105}) CREATE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id:503}), (s:Series {id:201}) CREATE (d)-[:DIRECTED]->(s);
MATCH (d:Director {id:504}), (s:Series {id:202}) CREATE (d)-[:DIRECTED]->(s);

// Relacionamentos IN_GENRE
MATCH (m:Movie {id:101}), (g:Genre {id:301}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:102}), (g:Genre {id:301}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:103}), (g:Genre {id:302}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:104}), (g:Genre {id:303}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:105}), (g:Genre {id:302}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (s:Series {id:201}), (g:Genre {id:302}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:202}), (g:Genre {id:301}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:203}), (g:Genre {id:305}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:204}), (g:Genre {id:302}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:205}), (g:Genre {id:304}) CREATE (s)-[:IN_GENRE]->(g);
