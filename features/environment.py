from behave_fixtures import cluster_setup_and_tear_down
from behave import use_fixture


def before_scenario(context, scenario):
    use_fixture(cluster_setup_and_tear_down, context)
