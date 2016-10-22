def includeme(config):
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.add_route(name='home', pattern='/')
    config.add_route(name='jobs', pattern='/jobs')
