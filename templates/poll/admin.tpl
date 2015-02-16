<div class="row">
    <div class="col-md-12">
        <h1>Poll</h1>
    </div>
</div>

<div class="row">
    <div class="col-xs-6 pull-left">
        <h2>Ajustes
            <small>cambiar ajustes</small>
            <button id="reset" class="btn btn-warning btn-xs pull-right">Reset</button>
            <button id="save" class="btn btn-success btn-xs pull-right">Guardar</button>
        </h2>
        <hr>
        <form class="form" id="pollSettingsForm">
            <h3>Toggles</h3>
            <div class="form-group">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" data-key="toggles.allowAnon"> Permitir a los usuarios ver los resultados antes de votar
                    </label>
                </div>
            </div>
            <h3>Limites</h3>
            <div class="form-group">
                <label for="maxPollOptions">Maximo numero de opciones por encuesta</label>
                <input type="number" class="form-control" id="maxPollOptions" placeholder="10" min="1" max="100" data-key="limits.maxOptions">
            </div>
            <h3>Por defecto..</h3>
            <div class="form-group">
                <label for="defaultsTitle">Título de la encuesta por defecto</label>
                <input type="text" class="form-control" id="defaultsTitle" placeholder="Poll" data-key="defaults.title">
            </div>
            <div class="form-group">
                <label for="defaultsMaxVotes">Maximo numero de votos por encuesta</label>
                <input type="number" class="form-control" id="defaultsMaxVotes" placeholder="1" min="1" max="100" data-key="defaults.maxvotes">
                <p class="help-block">Un numero mayor que 1 permitirá una votación multirespuesta</p>
            </div>
        </form>
    </div>
    <div class="col-xs-6 pull-right">
        <h2>Actiones
            <small>execute admin actions</small>
        </h2>
        <hr>
    </div>
</div>

<script>
    require(['settings'], function (settings) {
        var wrapper = $('#pollSettingsForm');
        settings.sync('poll', wrapper);
        $('#save').click(function(event) {
            event.preventDefault();
            settings.persist('poll', wrapper, function(){
                socket.emit('admin.plugins.poll.sync');
            });
        });
        $('#reset').click(function(event) {
            event.preventDefault();
            bootbox.confirm('Estas seguro de resetear las opciones?', function(sure) {
                if (sure) {
                    socket.emit('admin.plugins.poll.getDefaults', null, function (err, data) {
                        settings.set('poll', data, wrapper, function(){
                            socket.emit('admin.plugins.poll.sync');
                        });
                    });
                }
            });
        });
    });
</script>