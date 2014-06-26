/**
 * Created by Administrator on 2014-06-20.
 */
var typeData = {
    type_adventure: 1,
    type_practice: 1,
    type_rule: 1,
    type_tradition: 1,
    type_harmony: 1,
    type_enjoyment: 1,
    type_pleasure: 1
};

var chart = function () {
    var ctx = $("#myChart").get(0).getContext("2d");
    var ChartObject = new Chart(ctx);
    ChartObject.Radar(
        {
            labels: ["모험가", "실행가", "규율숭배자", "전통주의자", "조화론자", "향유자", "향락주의자"],
            datasets: [
                {
                    fillColor: "rgba(220,220,220,0.5)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    data: [typeData.type_adventure, typeData.type_practice, typeData.type_rule, typeData.type_tradition,
                        typeData.type_harmony, typeData.type_enjoyment, typeData.type_pleasure]
                }
            ]
        },
        {
            scaleOverride : true,
            scaleSteps : 5,
            scaleStepWidth : 1,
            scaleStartValue : 0,
            scaleFontSize: 15,
            scaleFontColor: "#f00",
            datasetStrokeWidth: 5
        });
};
$(".character-select-element select").on('change', function () {
    typeData[$(this)[0].name] = parseInt($(this)[0].value);
    chart();
});

var initChart = function(){
	var select = $(".character-select-element select");
	$.each(select,function(idx,  obj) {
			typeData[obj.name] = obj.value;
    });
	chart();
};

var chartOfCategory = function(){
	$.each(option,function(idx,  obj) {
		if(category_id.val() == obj.category_id) {
			typeData.type_adventure = obj.type_adventure;
			typeData.type_enjoyment = obj.type_enjoyment;
			typeData.type_harmony= obj.type_harmony;
			typeData.type_pleasure = obj.type_pleasure;
			typeData.type_rule = obj.type_rule;
			typeData.type_practice = obj.type_practice;
			typeData.type_tradition = obj.type_tradition;
			
			$(".character-select-element select").each(function() {
				this.value = typeData[this.name];
			});
			chart();			
		}
    });
};

	initChart();
