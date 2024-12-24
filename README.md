

# NBA Relational Database

A comprehensive relational database system designed to manage and maintain data for NBA players, coaches, games, stats, and awards.

## Features
- **Six Interconnected Tables**:
  - Designed using SQL on phpMyAdmin.
  - Established relationships through primary and foreign keys to ensure seamless data integration.
- **Data Population**:
  - Populated the database using both programmatic scripts and manual entry.
  - Demonstrates versatility in data input methods for a robust and flexible system.
- **Advanced SQL Query Execution**:
  - Enabled efficient creation, updating, and optimization of data.
  - Maintained normalization and data integrity for seamless operations.

## Database Schema
The database consists of the following tables:
1. **Players**: Contains player details such as name, team, and position.
2. **Coaches**: Stores information about NBA coaches and their respective teams.
3. **Games**: Includes game schedules, results, and participating teams.
4. **Stats**: Tracks player performance metrics for individual games.
5. **Awards**: Logs player and coach awards and achievements.
6. **Teams**: Maintains team details and relationships.

### Entity Relationships
- Primary and foreign keys establish relationships between tables for efficient data management.
- Example: `PlayerID` in the Players table connects to the `Stats` table for performance tracking.

