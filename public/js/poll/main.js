(function() {
	window.Poll = {
		load: function(data) {
			$(window).one('action:ajaxify.contentLoaded', function () {
				Poll.sockets.emit.load(data, function(err, poll) {
					if (!err) {
						Poll.view.init(poll, function(pollView) {
							if (parseInt(poll.info.deleted, 10) === 1 || parseInt(poll.info.ended, 10) === 1) {
								Poll.view.showMessage({
									title: 'Voting unavailable',
									content: 'This poll has ended or has been marked as deleted. You can still view the results.'
								}, pollView);
							}
						});
					} else if (err.message != 'Not logged in') {
						app.alertError('Something went wrong while getting the poll!');
					}
				});
			});
		}
	};
})();
