lib = import_module("github.com/kurtosis-tech/examples/simple-subpackage-example/lib/lib.star")

def run(plan):
    plan.print(lib.say_hello_world())
