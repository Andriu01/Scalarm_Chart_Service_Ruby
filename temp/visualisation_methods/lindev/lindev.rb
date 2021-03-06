class Lindev

  INFO = {
      'name' => 'Line chart',
      'id' => 'lindevModal',
      'group' => 'basic',
      'image' => '/chart/images/material_design/lindev_icon.png',
      'description' => 'Line chart with standard deviation'
  }

  def prepare_lindev_chart_content(parameters, data)
             var output = "<script>(function() { \nvar i=" + parameters["chart_id"] + ";";
             output += "\nvar data = " + JSON.stringify(data) + ";";
             output += "\nlindev_main(i, \"" + parameters["param1"] + "\", \"" + parameters["param2"] + "\", data);";
             output += "\n})();</script>"
             return output
  end

  def getter(param, args)
    (args.indexOf(param) < 0) ? return result[param] : return arguments[param]
  end

  def getLineDev (dao, id, param1, param2, success, error)
    # dane id array args mins maxes
    get_param1 = getter(param1, args)
    get_param2 = getter(param2, args)
    grouped_by_param1 = {}

    if grouped_by_param1.include? get_param1
      grouped_by_param1[get_param1].push

    end
  end




  function getLinDev(dao, id, param1, param2, success, error){
             dao.getData(id, function(array, args, mins, maxes){
                             var get_param1 = getter(param1, args);
                             var get_param2 = getter(param2, args);

                             var grouped_by_param1 = {};
                             array.map(function(obj) {
                                         if(get_param1(obj) in grouped_by_param1) {
                                             grouped_by_param1[get_param1(obj)].push(get_param2(obj));
                                         }
                                         else {
                                             grouped_by_param1[get_param1(obj)] = [get_param2(obj)];
                                         }
                                         });

                                         var values = [];
                                         for(var index in grouped_by_param1) {
                                             var sum = grouped_by_param1[index].reduce(function(a,b) { return a+b; }, 0);
                                         var mean = sum/grouped_by_param1[index].length;
                                         values.push([parseFloat(index), mean]);
                                         }
                                         values = values.sort(function(a, b) { return a[0]-b[0]; });

                                         var with_stddev = [];
                                         for(var index in grouped_by_param1) {
                                             var sum = grouped_by_param1[index].reduce(function(a,b) { return a+b; }, 0);
                                         var mean = sum/grouped_by_param1[index].length;

                                         var partial_sd = 0;
                                         for(var i in grouped_by_param1[index]) {
                                             partial_sd += Math.pow((grouped_by_param1[index][i]-mean),2);
                                         }
                                         var sd = Math.sqrt(partial_sd/grouped_by_param1[index].length);
                                         with_stddev.push([parseFloat(index), mean-sd, mean+sd]);
                                         }
                                         with_stddev = with_stddev.sort(function(a, b) { return a[0]-b[0]; });

                                         success([values, with_stddev]);
                                         }, error);
                                         }





                                         def handler(dao)
    # dane parameters success error
    if parameters["id"] && parameters["param1"] && parameters["param2"]

      if parameters["type"] == "data"
        object = content[JSON.stringify(data)]
        success(object)
      elsif parameters["chart_id"]

      end
    end
  end



  function handler(dao){
             return function(parameters, success, error){
               if(parameters["id"] && parameters["param1"] && parameters["param2"]) {
                   getLinDev(dao, parameters["id"], parameters["param1"], parameters["param2"], function(data) {

                                  else if(parameters["chart_id"]) {
                                      dao.getParameters(parameters["id"], function(retrieved_parameters) {
                                                                          object.content = prepare_lindev_chart_content(parameters, data);
                                                                          object.input_parameters = retrieved_parameters["parameters"];
                                                                          object.moes = retrieved_parameters["result"];
                                                                          success(object);
                                                                        }, error);
                                  }
                                       else {
                                           error("Request parameters missing: 'chart_id'");
                                       }
                                       }, error)
                                       }
                                       else {
                                           error("Request parameters missing: 'id', 'param1' or 'param2'");
                                       }
                                       }
                                       }



end
