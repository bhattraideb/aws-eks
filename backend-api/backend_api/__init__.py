__version__ = '0.1.0'

import os

from flask import Flask

from .views.hello_world import hello_world


def create_app():
    app = Flask(__name__)

    @app.route('/')
    def home():
        return hello_world()

    # @app.route('/fizzbuzz/<int:number>')
    # def fizzbuzz_check(number):
    #     return check_fizzbuzz(number)
    #
    # @app.route('/prime/<int:number>')
    # def prime_check(number):
    #     if check_prime(number):
    #         return 'Yes'
    #     return 'No'
    #
    # @app.route('/fibonacci/check/<int:number>')
    # def fibonacci_check(number) -> str:
    #     if check_fibonacci(number):
    #         return 'Yes'
    #     return 'No'
    #
    # @app.route('/fibonacci/generate/<int:number>')
    # def fibonacci_generate(number):
    #     return generate_fibonacci(number)

    return app


if __name__ == '__main__':
    create_app().run(host='0.0.0.0', port=5000, debug=True)