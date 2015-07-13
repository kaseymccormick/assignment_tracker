# Load/create our database for this program.
CONNECTION = SQLite3::Database.new("assignments.db")

# Make the tables.
CONNECTION.execute("CREATE TABLE IF NOT EXISTS assignments (id INTEGER PRIMARY KEY, description TEXT, github_repo TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS resource_types (id INTEGER PRIMARY KEY, category TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS resources (id INTEGER PRIMARY KEY, rt_id INTEGER, assignment_id INTEGER);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS contributions (user_id INTEGER, assignment_id INTEGER);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS contributors (id INTEGER PRIMARY KEY, name TEXT);")

# Get results as an Array of Hashes.
CONNECTION.results_as_hash = true