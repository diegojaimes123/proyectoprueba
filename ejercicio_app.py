from flask import Flask
from flask import request 
from flask import render_template

sample = Flask(__name__)

@sample.route("/")
def main():
    return render_template("index.html")

@sample.route("/blog")
def about():
    return render_template("blog/blog_index_page.html")

# @sample.route("/contact")
# def contact():
#     return render_template("contact.html")


if (__name__ == "__main__"):
    sample.run(host="0.0.0.0", port=5050)