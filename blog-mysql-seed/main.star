mysql = import_module("github.com/kurtosis-tech/mysql-package/mysql.star")

SELECT_SQL_EXAMPLE = "SELECT * FROM post"

def run(plan, args):
    setup_sql = plan.upload_files(
        src = "github.com/kurtosis-tech/awesome-kurtosis/blog-mysql-seed/setup.sql",
    )
    seed_sql = read_file(
        src = "github.com/kurtosis-tech/awesome-kurtosis/blog-mysql-seed/seed.sql",
    )
    db = mysql.create_database(plan, args["database"], args["username"], args["password"], seed_script_artifact = setup_sql)
    mysql.run_sql(plan, db, seed_sql)
    mysql.run_sql(plan, db, SELECT_SQL_EXAMPLE)
