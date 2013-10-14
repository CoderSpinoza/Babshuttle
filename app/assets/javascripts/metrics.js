$(document).ready(function() {
	var chart = new CanvasJS.Chart("new_user_graph", {
		theme: "theme2",
		title: {
			text: "New User Metrics"
		},
		axisX: {
			valueFormatString: "DDD",
			interval: 1,
			intervalType: "day"
		}
	});
});