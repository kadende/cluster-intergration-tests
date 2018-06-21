from behave import fixture


@fixture
def cluster_setup_and_tear_down(context):
    # todo write command to start cluster-service
    yield
    # todo write command to stop  the cluster service
