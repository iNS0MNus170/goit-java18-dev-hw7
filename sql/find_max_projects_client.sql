SELECT c.NAME, COUNT(p.ID) AS PROJECT_COUNT
FROM client c
         JOIN project p ON c.ID = p.CLIENT_ID
GROUP BY c.NAME
HAVING COUNT(p.ID) = (
    SELECT MAX(project_count)
    FROM (SELECT COUNT(ID) AS project_count
          FROM project
          GROUP BY CLIENT_ID) subquery
);