from flask import Flask, render_template, request, jsonify, redirect, url_for
import mysql.connector
app = Flask(__name__, static_folder='static')
import datetime

cnx = mysql.connector.connect(
    host="localhost",
    user="root",
    password="89010607",
    database="db"
)
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/HomeScreen')
def homescreen():
    return render_template('HomeScreen.html')

@app.route('/Category')
def category():
    return render_template('Category.html')

@app.route('/SideMenu')
def side_menu():
    return render_template('SideMenu.html')

@app.route('/Restaurant')
def restaurant():
    return render_template('Restaurant.html')

@app.route('/Rating')
def rating():
    return render_template('Rating.html')

@app.route('/ProfileViewerID')
def profileViewerID():
    return render_template('ProfileViewerID.html')

@app.route('/ProfileResturantID')
def profileResturantID():
    return render_template('ProfileResturantID.html')

@app.route('/Login')
def login():
    return render_template('Login.html')

@app.route('/login_check', methods=['POST'])
def login_check():
    username = request.form.get('username')

    # Perform the MySQL query to check if the user exists
    query = f"SELECT * FROM User WHERE User_name = '{username}'"
    cursor = cnx.cursor()
    cursor.execute(query)
    result = cursor.fetchone()

    if result:
        # User found in the database
        return "User exists", 200
    else:
        # User not found in the database
        return "User not found", 404

@app.route("/update_scores", methods=["POST"])
def update_scores():
    data = request.json
    score1 = data.get("score1")
    score2 = data.get("score2")
    score3 = data.get("score3")
    cursor = cnx.cursor()
    query =  f"UPDATE Restaurant_Score SET Score1 = (Score1 * TotalRatings + {score1}) / (TotalRatings + 1), Score2 = (Score2 * TotalRatings + {score2}) / (TotalRatings + 1), Score3 = (Score3 * TotalRatings + {score3}) / (TotalRatings + 1), TotalRatings = TotalRatings + 1 WHERE Restaurant_ID = 1;"
    cursor.execute(query)
    cnx.commit()

    # Close the database connection
    cursor.close()
    cnx.close()
    print(query)
    return jsonify()

@app.route("/get_scores", methods=["GET"])
def get_scores():
    try:
        # Connect to the MySQL database
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="89010607",
            database="db"
        )

        cursor = connection.cursor()

        # Perform the database query to fetch the scores
        query = "SELECT Score1, Score2, Score3 FROM Restaurant_Score WHERE Restaurant_ID = 1;"
        cursor.execute(query)
        scores = cursor.fetchone()

        # Close the database connection
        cursor.close()
        connection.close()

        # Return the scores as a JSON response
        return jsonify({
            "score1": scores[0],
            "score2": scores[1],
            "score3": scores[2]
        })
    except Exception as e:
        # Print the error message for debugging
        print(f"Error fetching scores: {str(e)}")
        # Return an error response
        return jsonify({"message": "Failed to fetch scores"}), 500

@app.route('/search', methods=['GET'])
def search():
    search_term = request.args.get('search')

    # Perform the MySQL query using the search term
    query = f"SELECT * FROM Restaurant WHERE Restaurant_type LIKE '%{search_term}%'"
    search_term = request.args.get('search')

    cursor = cnx.cursor()
    cursor.execute(query)
    results = cursor.fetchall()
    return render_template('Search.html', results=results)

# 查看所有留言 for user
@app.route('/search_comment_user', methods=['GET'])
def search_comment_user():
    search_term = request.args.get('search')

    # Perform the MySQL query using the search term
    
    query = f"SELECT u.user_name, c.* FROM comment c JOIN user u ON c.user_id = u.user_id WHERE u.user_name = '{search_term}';"

    cursor = cnx.cursor()
    cursor.execute(query)
    results = cursor.fetchall()
    #print(results)
    return render_template('Search.html', results=results)

@app.route('/search_comment_res', methods=['GET'])
def search_comment_res():
    search_term = request.args.get('search')

    # Perform the MySQL query using the search term
    
    query = f"SELECT c.comment_id, u.user_name, r.restaurant_name, c.comment_info, c.comment_time FROM comment c JOIN restaurant r ON c.R_ID = r.Restaurant_ID JOIN User u ON c.User_ID = u.User_ID WHERE r.restaurant_name LIKE '%{search_term}%';"

    cursor = cnx.cursor()
    cursor.execute(query)
    results = cursor.fetchall()
    #print(results)
    return render_template('Search.html', results=results)



# Search restaurant price
@app.route("/get_data", methods=["POST"])
def get_data():
    search_term = request.form.get("search_term")
    # Connect to the MySQL database
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="89010607",
        database="db"
    )

    cursor = connection.cursor()

    # Perform the database query using the search term
    query = "SELECT Restaurant_info FROM Restaurant WHERE Restaurant_name LIKE '%{}%'".format(search_term)
    cursor.execute(query)
    # Fetch the results
    results = cursor.fetchall()

    # Process the results as needed
    data = []
    for result in results:
        # Process each row and extract the desired data
        # Assuming the desired data is in the first column (Restaurant_info)
        restaurant_info = result[0]
        data.append(restaurant_info)

    # Close the database connection
    cursor.close()
    connection.close()
    #print(data)
    # Return the data as a JSON response
    return jsonify(data)

@app.route("/get_user_data", methods=["POST"])
def get_user_data():
    search_term = request.form.get("search_term")
    # Connect to the MySQL database
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="89010607",
        database="db"
    )

    cursor = connection.cursor()

    # Perform the database query using the search term
    query = "SELECT User_name, Comment_info, Comment_ID FROM COMMENT c, User u where c.User_id = u.user_id and user_name = '{}'".format(search_term)
    #print(query)
    cursor.execute(query)
    # Fetch the results
    results = cursor.fetchall()
    #print(results)

    # Process the results as needed
    data = []
    for result in results:
        # Process each row and extract the desired data
        # Assuming the desired data is in the first column (Restaurant_info)
        restaurant_info = result
        data.append(restaurant_info)

    # Close the database connection
    cursor.close()
    connection.close()
    #print(data)
    # Return the data as a JSON response
    return jsonify(data)

@app.route("/get_new_user_data", methods=["POST"])
def get_new_user_data():
    search_term = request.form.get("search_term")
    # Connect to the MySQL database
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="89010607",
        database="db"
    )

    cursor = connection.cursor()

    # Perform the database query using the search term
    query = "SELECT User_name, Comment_info, Comment_time FROM COMMENT c, User u where c.User_id = u.user_id ORDER BY Comment_time DESC LIMIT 1;"
    cursor.execute(query)
    # Fetch the results
    results = cursor.fetchall()

    # Process the results as needed
    data = []
    for result in results:
        # Process each row and extract the desired data
        # Assuming the desired data is in the first column (Restaurant_info)
        restaurant_info = result
        data.append(restaurant_info)
    
    data = list(*data)

    dt = data[2]
    year = dt.strftime("%Y")
    month = dt.strftime("%m")
    day = dt.strftime("%d")
    formatted_date = f"{day}/{month}/{year}"
    print(formatted_date)
    data[2] = formatted_date
    #print(data)
    # Close the database connection
    cursor.close()
    connection.close()
    #print(data)
    # Return the data as a JSON response
    return jsonify(data)

@app.route("/insert_comment", methods=["POST"])
def insert_comment():
    comment = request.form.get("comment")
    
    # Connect to the MySQL database
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="89010607",
        database="db"
    )

    cursor = connection.cursor()

    # Perform the database insertion
    query = "INSERT INTO COMMENT (Comment_ID, Comment_info, Comment_time, User_ID) VALUES (LAST_INSERT_ID(), %s, NOW(), 4)"
    cursor.execute(query, (comment,))
    connection.commit()

    # Close the database connection
    cursor.close()
    connection.close()
    print(query)
    # Return a success response
    return jsonify({"message": "Comment inserted successfully"})


if __name__ == '__main__':
    app.run()
